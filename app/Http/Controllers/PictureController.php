<?php

namespace App\Http\Controllers;

use App\Http\Requests\PictureRequest;
use Illuminate\Http\Request;
use App\Picture;
use Illuminate\Support\Facades\Storage;

class PictureController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth')->except('index', 'show');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($request->search) {
            $pictures = Picture::join('users', 'author_id', '=', 'users.id')->where('tag', 'like', '%' . $request->search . '%')->orderBy('pictures.created_at', 'desc')->get();
            return view('pictures.index', compact('pictures'));
        }

        $pictures = Picture::join('users', 'author_id', '=', 'users.id')->orderBy('pictures.created_at', 'desc')->paginate(8);

        return view('pictures.index', compact('pictures'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pictures.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(PictureRequest $request)
    {
        $images = $request->file('img');

        foreach ($images as $image) 
        {
            $picture = new Picture();
            $picture->tag = $request->tag;
            $picture->countViews = 0;

            $path = Storage::putFile('public', $image);
            $url = Storage::url($path);
            $picture->img = $url;
            $picture->author_id = \Auth::user()->id;;
            
            $picture->save();
        }

        return redirect()->route('picture.index')->with('success', 'Картинки успешно загружены на сайт');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $picture = Picture::join('users', 'author_id', '=', 'users.id')->find($id);
        

        $picture->countViews = $picture->countViews + 1;
        $picture->save();

        return view('pictures.show', compact('picture'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $picture = Picture::find($id);



        if($picture->author_id != \Auth::user()->id) {
            return redirect()->route('picture.index')->withErrors('Вы не можете редактировать данную картинку');
        }
        return view('pictures.edit', compact('picture'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(PictureRequest $request, $id)
    {
        $picture = Picture::find($id);

        if($picture->author_id != \Auth::user()->id) {
            return redirect()->route('picture.index')->withErrors('Вы не можете редактировать данную картинку');
        }

        $picture->tag = $request->tag;
        $picture->countViews = $picture->countViews -1; 

        $picture->update();
        $id = $picture->picture_id;
        return redirect()->route('picture.show', compact('id'))->with('success', 'Тег успешно отредактирован');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $picture = Picture::find($id);

        if($picture->author_id != \Auth::user()->id) {
            return redirect()->route('picture.index')->withErrors('Вы не можете редактировать данную картинку');
        }

        $picture->delete();
        return redirect()->route('picture.index')->with('success', 'Картинка успешно удалена');

    }
}

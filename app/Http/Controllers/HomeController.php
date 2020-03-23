<?php

namespace App\Http\Controllers;

use App\Picture;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
    
    $id = \Auth::user()->id;
    $pictures = Picture::join('users', 'author_id', '=', 'users.id')->where('author_id', $id)->paginate(8);

    return view('home', compact('pictures'));
    }
}

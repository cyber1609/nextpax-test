<?php

namespace App\Http\Controllers;

use App\Services\LengthOfStayService;
use Illuminate\Http\Request;
use Illuminate\View\View;

class IndexController extends Controller
{
    public function __construct(private readonly LengthOfStayService $lengthOfStayService)
    {
    }

    public function __invoke(Request $request): View
    {
        return view('index', [
            'data' => $this->lengthOfStayService->getLengthOfStayPricing(),
        ]);
    }
}

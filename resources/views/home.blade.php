@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">

        {{-- Dashboard Card --}}
        <div class="col-md-8 mb-4">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    {{ __('You are logged in!') }}
                </div>
            </div>
        </div>
    
        {{-- Create Project Card --}}
        <div class="col-md-8">
            <div class="card border-primary">
                <div class="card-header bg-primary text-white">
                    Create New Project
                </div>

                <div class="card-body text-center">
                    <p class="mb-3">
                        Start a new project by creating a product.
                    </p>

                    <a href="{{ route('products.create') }}" class="btn btn-primary">
                        + Create Project
                    </a>
                </div>
            </div>
        </div>

    </div>
</div>
@endsection

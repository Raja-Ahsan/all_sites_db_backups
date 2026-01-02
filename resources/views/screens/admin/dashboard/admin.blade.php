{{-- super admin dashboard --}}

@section('title', 'Dashboard')
@extends('layouts.admin.master')
@section('content')
    <div class="container-fluid row-gap-20 default-dashboard">
        <div class="row widget-grid">
            <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
                <div class="card widget-1">
                    <div class="card-body">
                        <div class="widget-content">
                            <div class="widget-round secondary">
                                <div class="bg-round">
                                    <svg>
                                        <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#c-revenue') }}"></use>
                                    </svg><svg class="half-circle svg-fill">
                                        <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#halfcircle') }}">
                                        </use>
                                    </svg>
                                </div>
                            </div>
                            <div>
                                <span class="f-light">Total Revenue</span>
                                <h4>
                                    <span class="">
                                        <span class="" data-target="">0</span>
                                    </span>
                                </h4>
                            </div>
                        </div>
                        {{-- <div class="font-success f-w-500">
                            <i class="bookmark-search me-1"></i><span class="txt-success">+50%</span>
                        </div> --}}
                    </div>
                </div>
            </div>
            <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
                <div class="card widget-1">
                    <div class="card-body">
                        <div class="widget-content">
                            <div class="widget-round secondary">
                                <div class="bg-round">
                                    <svg>
                                        <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#c-revenue') }}"></use>
                                    </svg><svg class="half-circle svg-fill">
                                        <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#halfcircle') }}">
                                        </use>
                                    </svg>
                                </div>
                            </div>
                            <div>
                                <span class="f-light">Total Users</span>
                                <h4>
                                    <span class="">
                                        <span class="" data-target="">0</span>
                                    </span>
                                </h4>
                            </div>
                        </div>
                        {{-- <div class="font-success f-w-500">
                            <i class="bookmark-search me-1"></i><span class="txt-success">+50%</span>
                        </div> --}}
                    </div>
                </div>
            </div>
            <div class="col-xxl-auto col-xl-3 col-sm-6 box-col-3">
                <div class="card widget-1">
                    <div class="card-body">
                        <div class="widget-content">
                            <div class="widget-round secondary">
                                <div class="bg-round">
                                    <svg>
                                        <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#c-revenue') }}"></use>
                                    </svg><svg class="half-circle svg-fill">
                                        <use href="{{ asset('/assets/libs/svg/icon-sprite.svg#halfcircle') }}">
                                        </use>
                                    </svg>
                                </div>
                            </div>
                            <div>
                                <span class="f-light">Total Gyms</span>
                                <h4>
                                    <span class="">
                                        <span class="" data-target="">0</span>
                                    </span>
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('scripts')
    <script src="{{ asset('assets/libs/js/chart/apex-chart/stock-prices.js') }}"></script>
    <script src="{{ asset('assets/libs/js/chart/apex-chart/apex-chart.js') }}"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Wait for ApexCharts to be available
            if (typeof ApexCharts === 'undefined') {
                console.error('ApexCharts library not loaded');
                return;
            }

            // Check if element exists
            var chartElement = document.querySelector("#chart-currently");
            if (!chartElement) {
                console.error('Chart element #chart-currently not found');
                return;
            }

            // Get primary color from config or use default
            var primaryColor = (typeof CubaAdminConfig !== 'undefined' && CubaAdminConfig.primary) ? CubaAdminConfig
                .primary : "#7366FF";

            // currently sale
            var chartCurrent = {
                series: [{
                        name: "Earning",
                        data: [300, 150, 250, 270, 400, 420, 600, 420, 400, 700, 600, 200],
                    },
                    {
                        name: "Expense",
                        data: [300, 750, 700, 840, 850, 999, 900, 999, 850, 470, 400, 500],
                    },
                ],
                chart: {
                    type: "bar",
                    height: 312,
                    stacked: true,
                    toolbar: {
                        show: false,
                    },
                    dropShadow: {
                        enabled: true,
                        top: 8,
                        left: 0,
                        blur: 8,
                        color: "#7064F5",
                        opacity: 0.1,
                    },
                },
                plotOptions: {
                    bar: {
                        horizontal: false,
                        columnWidth: "20%",
                        borderRadius: 0,
                    },
                },
                grid: {
                    borderColor: "var(--chart-border)",
                    yaxis: {
                        lines: {
                            show: true,
                        },
                    },
                },
                dataLabels: {
                    enabled: false,
                },
                stroke: {
                    width: 2,
                    dashArray: 0,
                    lineCap: "butt",
                    colors: "#fff",
                },
                fill: {
                    opacity: 1,
                },
                legend: {
                    show: false,
                },
                states: {
                    hover: {
                        filter: {
                            type: "darken",
                            value: 1,
                        },
                    },
                },
                colors: [primaryColor, "#AAAFCB"],
                yaxis: {
                    tickAmount: 3,
                    labels: {
                        show: true,
                        style: {
                            fontFamily: "Rubik, sans-serif",
                        },
                    },
                    axisBorder: {
                        show: false,
                    },
                    axisTicks: {
                        show: false,
                    },
                },
                xaxis: {
                    categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov",
                        "Dec"
                    ],
                    labels: {
                        style: {
                            fontFamily: "Rubik, sans-serif",
                        },
                    },
                    axisBorder: {
                        show: false,
                    },
                    axisTicks: {
                        show: false,
                    },
                },
                responsive: [{
                        breakpoint: 1400,
                        options: {
                            chart: {
                                height: 310,
                            },
                        },
                    },
                    {
                        breakpoint: 1200,
                        options: {
                            chart: {
                                height: 280,
                            },
                        },
                    },
                    {
                        breakpoint: 767,
                        options: {
                            plotOptions: {
                                bar: {
                                    columnWidth: "15px",
                                },
                            },
                            yaxis: {
                                labels: {
                                    show: false,
                                },
                            },
                        },
                    },
                    {
                        breakpoint: 576,
                        options: {
                            plotOptions: {
                                bar: {
                                    columnWidth: "8px",
                                },
                            },
                        },
                    },
                    {
                        breakpoint: 400,
                        options: {
                            plotOptions: {
                                bar: {
                                    columnWidth: "6px",
                                },
                            },
                        },
                    },
                ],
            };

            var currentChart = new ApexCharts(chartElement, chartCurrent);
            currentChart.render();
        });
    </script>
@endpush

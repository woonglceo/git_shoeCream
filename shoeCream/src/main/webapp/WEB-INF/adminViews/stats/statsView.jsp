<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
  <div class="col-md-12">
    <div class="card ">
      <div class="card-header ">
        <h5 class="card-title">Users Behavior</h5>
        <p class="card-category">24 Hours performance</p>
      </div>
      <div class="card-body "><div class="chartjs-size-monitor" style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
        <canvas id="chartHours" width="1369" height="342" style="display: block; height: 228px; width: 913px;" class="chartjs-render-monitor"></canvas>
      </div>
      <div class="card-footer ">
        <hr>
        <div class="stats">
          <i class="fa fa-history"></i> Updated 3 minutes ago
        </div>
      </div>
    </div>
  </div>
</div>

<div class="row">
  <div class="col-md-4">
    <div class="card ">
      <div class="card-header ">
        <h5 class="card-title">Email Statistics</h5>
        <p class="card-category">Last Campaign Performance</p>
      </div>
      <div class="card-body "><div class="chartjs-size-monitor" style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
        <canvas id="chartEmail" width="397" height="198" style="display: block; height: 132px; width: 265px;" class="chartjs-render-monitor"></canvas>
      </div>
      <div class="card-footer ">
        <div class="legend">
          <i class="fa fa-circle text-primary"></i> Opened
          <i class="fa fa-circle text-warning"></i> Read
          <i class="fa fa-circle text-danger"></i> Deleted
          <i class="fa fa-circle text-gray"></i> Unopened
        </div>
        <hr>
        <div class="stats">
          <i class="fa fa-calendar"></i> Number of emails sent
        </div>
      </div>
    </div>
  </div>
  <div class="col-md-8">
    <div class="card card-chart">
      <div class="card-header">
        <h5 class="card-title">NASDAQ: AAPL</h5>
        <p class="card-category">Line Chart with Points</p>
      </div>
      <div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; inset: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
        <canvas id="speedChart" width="883" height="220" style="display: block; height: 147px; width: 589px;" class="chartjs-render-monitor"></canvas>
      </div>
      <div class="card-footer">
        <div class="chart-legend">
          <i class="fa fa-circle text-info"></i> Tesla Model S
          <i class="fa fa-circle text-warning"></i> BMW 5 Series
        </div>
        <hr>
        <div class="card-stats">
          <i class="fa fa-check"></i> Data information certified
        </div>
      </div>
    </div>
  </div>
</div>
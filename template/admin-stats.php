<div class="container mt-4">
    <h2>Admin Statistics</h2>
    
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    Premium User Percentage
                </div>
                <div class="card-body">
                    <h3 class="text-center">
                        <?php 
                        if(isset($templateParams["premium_percentage"]["percentuale_premium"])) {
                            echo number_format($templateParams["premium_percentage"]["percentuale_premium"], 2) . "%";
                        } else {
                            echo "No data available";
                        }
                        ?>
                    </h3>
                    <p class="text-center">of users are currently on Premium</p>
                </div>
            </div>
        </div>
        
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    Average Ads Before Premium
                </div>
                <div class="card-body">
                    <h3 class="text-center">
                        <?php 
                        if(isset($templateParams["avg_ads"]["media_pubblicita_prima_premium"])) {
                            echo number_format($templateParams["avg_ads"]["media_pubblicita_prima_premium"], 1);
                        } else {
                            echo "No data available";
                        }
                        ?>
                    </h3>
                    <p class="text-center">ads viewed on average before subscribing to Premium</p>
                </div>
            </div>
        </div>
    </div>
</div>

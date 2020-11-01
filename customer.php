<?php
// Include config file
require_once "config.php";
 
// Define variables and initialize with empty values
$id = $name = $street = $city = $state = $zip =  "";
$id_err = $name_err = $street_err = $city_err = $state_err = $zip_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    // Validate id number
    $input_id = trim($_POST["id"]);
    if(empty($input_id)){
        $id_err = "Please enter a valid id";     
    } else{
        $id = $input_id;
    }
    
    // Validate name
    $input_name = trim($_POST["name"]);
    if(empty($input_name)){
        $name_err = "Please enter a name.";
    } elseif(!filter_var($input_name, FILTER_VALIDATE_REGEXP, array("options"=>array("regexp"=>"/^[a-zA-Z\s]+$/")))){
        $name_err = "Please enter a valid name.";
    } else{
        $name = $input_name;
    }
    
    // Validate street address
    $input_street = trim($_POST["street"]);
    if(empty($input_street)){
        $street_err = "Please enter a street address.";     
    } else{
        $street = $input_street;
    }
    
    // Validate city address
    $input_city = trim($_POST["city"]);
    if(empty($input_city)){
        $city_err = "Please enter the city address";     
    } else{
        $city = $input_city;
    }
    
    // Validate state address
    $input_state = trim($_POST["state"]);
    if(empty($input_state)){
        $state_err = "Please enter the state address";     
    } else{
        $state = $input_state;
    }
    
    // Validate Zip address
    $input_zip = trim($_POST["zip"]);
    if(empty($input_zip)){
        $zip_err = "Please enter the zip address";     
    } else{
        $zip = $input_zip;
    }
    
    // Check input errors before inserting in database
    if(empty($id_err) && empty($name_err) && empty($street_err) && empty($city_err) && empty($state_err) && empty($zip_err)){
        // Prepare an insert statement
        $sql = "INSERT INTO customer (Customer_ID, Customer_Name, Address_Street,Address_City, Address_State, Address_Zip) VALUES (?, ?, ?, ?, ?, ?)";
         
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssssss",$param_id, $param_name, $param_street, $param_city, $param_state, $param_zip);
            
            // Set parameters
            $param_id = $id;
            $param_name = $name;
            $param_street = $street;
            $param_city = $city;
            $param_state = $state;
            $param_zip = $zip;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Records created successfully. Redirect to landing page
                header("location: index.php");
                exit();
            } else{
                echo "Something went wrong. Please try again later.";
            }
        }
         
        // Close statement
        mysqli_stmt_close($stmt);
    }
    
    // Close connection
    mysqli_close($link);
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Record</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        .wrapper{
            width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header">
                        <h2>Welcome to Dearborn Jewelry!!</h2>
                    </div>
                    <p>Please fill this form and submit to add customer record to the database.</p>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <div class="form-group <?php echo (!empty($id_err)) ? 'has-error' : ''; ?>">
                            <label>Customer Id</label>
                            <input type="text" name="id" class="form-control" value="<?php echo $id; ?>">
                            <span class="help-block"><?php echo $id_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($name_err)) ? 'has-error' : ''; ?>">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control" value="<?php echo $name; ?>">
                            <span class="help-block"><?php echo $name_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($street_err)) ? 'has-error' : ''; ?>">
                            <label>Street Address</label>
                            <input type="text" name="street" class="form-control" value="<?php echo $street; ?>">
                            <span class="help-block"><?php echo $street_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($city_err)) ? 'has-error' : ''; ?>">
                            <label>City address</label>
                            <input type="text" name="city" class="form-control" value="<?php echo $city; ?>">
                            <span class="help-block"><?php echo $city_err;?></span>
                        </div>        
                        <div class="form-group <?php echo (!empty($state_err)) ? 'has-error' : ''; ?>">
                            <label>State address</label>
                            <textarea name="state" class="form-control"><?php echo $state; ?></textarea>
                            <span class="help-block"><?php echo $state_err;?></span>
                        </div>
                        <div class="form-group <?php echo (!empty($zip_err)) ? 'has-error' : ''; ?>">
                            <label>Zip Code</label>
                            <input type="text" name="zip" class="form-control" value="<?php echo $zip; ?>">
                            <span class="help-block"><?php echo $zip_err;?></span>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Submit">
                        <a href="index.php" class="btn btn-default">Cancel</a>
                    </form>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>
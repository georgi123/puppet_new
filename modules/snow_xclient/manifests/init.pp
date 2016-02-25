class snow_xclient {

    include snow_xclient::params
    include snow_xclient::package
    Class[snow_xclient::params] -> Class[snow_xclient::package] 
    
}

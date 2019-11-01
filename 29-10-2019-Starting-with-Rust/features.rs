fn main()
{

    

    let x = 10;       
                       
    let mut y  = 100; 
    println!("x = {0} and y = {1}",x,y);
    y = 42;

 

    println!("x = {0} and y = {1}",x,y);

    

    let mut xbox  = Box::new(10);
    println!("xbox = {0}", xbox);

    let mut ybox  = &mut xbox; /* here we are just copy the value */
    let mut zbox  = ybox; //here we can do so called ownership because we just copy and giving that copy to zbox
    //println!("xbox = {0}", xbox); // Uncomment and get an error
    println!("zbox = {0}", zbox);

    //let zbox = &ybox; /* zbox borrows the resource form y */

   // println!("ybox = {0} and zbox = {1}", ybox, zbox);
   let mut a = 10;
   let mut b = &a;
   b=&100;
   /* here we can't do *b = 100; because even you assign b mut it mean you can just point b to different 
    integer but can't change value on that address for that you have to set mut to value */
   let mut c = &mut a;
   *c=100; 
   println!("a = {0}", a);
   
   
   
   

   


}

BEGIN { 
        FS=" "
	stat = 0 
} 
{ 
  if ( 110 < NR && NR < 137 ) {
          stat += $2;
  }
}  
END {
res = stat / 26
print res
}                                                                        

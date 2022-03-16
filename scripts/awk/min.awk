NR==1  {min=$1}

$1<=min{min=$1}

END{
  OFMT="%.6f"
  print min
}

#!/bin/bash
 tput setab 16
oldsetting=`stty -g`
stty -echo
stty -icanon
score=0
color=0
declare -a myrows;
declare -a mycols; 

print(){
  clear
  unset myrows
  unset mycols
 score=0
 snakeclear=0
rows=`tput lines`
columns=`tput cols`
tput bold
tput civis
mid=$(($columns/3+5))
scpos=$(($columns-29))
tput cup 4 $scpos
tput cup 2 $mid
  tput setaf 7
echo "SNAKE GAME "
loc=$(($mid-5))
tput cup 3 $loc
echo "Made By -> NEELESH BHAKT"

tput cup 33 $mid
echo "Press q to Quit"
tput setaf 7;
tput cup 5 15
for((i=15;i<=columns-20;i++))
do
   echo "-"
   tput cup 5 $i
done

for((i=5;i<=rows-8;i++))
do
   echo "-"
   tput cup $i 15
done
j=$i
for((i=15;i<=columns-20;i++))
do
   echo "-"
   tput cup $j $i
done
j=$i
for((i=5;i<=rows-6;i++))
do
   echo "-"
   tput cup $i $j
done
 color=$(($color%5))
     case $color in
                  0)tput setaf 2 ;;
                  1)tput setaf 4 ;;
                  2)tput setaf 1 ;;
                  3)tput setaf 6 ;;
                  4)tput setaf 7 ;;
                 esac
#tput setaf $color
x=$(($rows/2))
y=$(($columns/2))
myrows=("${myrows[@]}" "$x")
mycols=("${mycols[@]}" "$y")
tput cup $x $y
}
##########################################################################################################################
funcA(){
  ((score++))
  tput setaf 7;
scpos=$(($columns-29))
tput cup 4 $scpos
echo "SCORE : $score"
  tput cup $endx $endy
                echo ' '
             
               color=$(($color%5))
    
                case $color in
                  0)tput setaf 2 ;;
                  1)tput setaf 4 ;;
                  2)tput setaf 1 ;;
                  3)tput setaf 6 ;;
                  4)tput setaf 7 ;;
                 esac
                  
                tput cup $x $y
               x=$(($x-1))
              tput cup $x $y
                if(($x<7))
                then
                  echo -en "\007"
                  dflag=1
                 print
                 fi
                  
               tput cup $x $y
                   myrowssize=("${#myrows[@]}")
                   mycolsize=("${#mycol[@]}")
                   
                  for((in=0;in<myrowssize;in++))
                  do
                       valx=${myrows[$in]}
                       valy=${mycols[$in]}
                       if((x==valx))
                       then
                        if((y==valy))
                        then
                           
                           if((dflag!=1))
                           then
                            echo -en "\007" 
                          print
                        else
                          dflag=0
                        fi
                        fi
                      fi
   
                    done
                  echo '*'
                   var=$(($x-1))
 
                   tput cup $var $y
                   echo '^'
                   endx=$var
                   endy=$y
                   flagdown=0
                  flagleft=0
                  flagright=0
                   flagup=1
                   myrows=("${myrows[@]}" "$x")
                   mycols=("${mycols[@]}" "$y")
                     clearx=${myrows[0]}
                    cleary=${mycols[0]}
                    if(($snakeclear%8!=0))
                    then
                    tput cup $clearx $cleary
                    myrows=("${myrows[@]:1}")
                    mycols=("${mycols[@]:1}")
                       echo ' '
                    fi   
                tput cup $x $y
 }
 ###############################################################################################################################################
 funcB(){
    ((score++))
    tput setaf 7;
scpos=$(($columns-29))
tput cup 4 $scpos
echo "SCORE : $score"
  tput cup $endx $endy
                echo ' '
                tput cup $x $y
                      color=$(($color%5))
           
                case $color in
                  0)tput setaf 2 ;;
                  1)tput setaf 4 ;;
                  2)tput setaf 1 ;;
                  3)tput setaf 6 ;;
                  4)tput setaf 7 ;;
                 esac

               x=$(($x+1))
              tput cup $x $y
                limit=$(($rows-9))
                if(($x>limit))
                 then
                  echo -en "\007"
                  dflag=1
                 print
                 fi
               tput cup $x $y
               var=$(($x+1))
                   myrowssize=("${#myrows[@]}")
                   mycolsize=("${#mycol[@]}")
                  for((in=0;in<myrowssize;in++))
                  do
                       valx=${myrows[$in]}
                       valy=${mycols[$in]}
                     if((x==valx))
                       then
                        if((y==valy))
                        then
                          
                            if((dflag!=1))
                           then
                             echo -en "\007"
                          print
                        else
                          dflag=0
                        fi
                        
                        fi
                      fi
                    done
               echo '*'
               tput cup $var $y
               echo "v"
               flagup=0
               flagleft=0
               flagright=0
               flagdown=1
               endx=$var
               endy=$y
                      myrows=("${myrows[@]}" "$x")
                   mycols=("${mycols[@]}" "$y")
                     clearx=${myrows[0]}
                    cleary=${mycols[0]}
                    if(($snakeclear%8!=0))
                    then
                    tput cup $clearx $cleary
                    myrows=("${myrows[@]:1}")
                    mycols=("${mycols[@]:1}")
                       echo ' '
                    fi  
               tput cup $x $y
 }
###########################################################################################################################################
funcC(){
    ((score++))
    tput setaf 7;
scpos=$(($columns-29))
tput cup 4 $scpos
echo "SCORE : $score"
  tput cup $endx $endy
                echo ' '
               tput cup $x $y
                         color=$(($color%5))

                case $color in
                  0)tput setaf 2 ;;
                  1)tput setaf 4 ;;
                  2)tput setaf 1 ;;
                  3)tput setaf 6 ;;
                  4)tput setaf 7 ;;
                 esac
                 y=$(($y+1))
                 tput cup $x $y
                 limit=$(($columns-21))
                 if(($y>limit))
                 then
                  echo -en "\007"
                  dflag=1
               print
                 fi
                tput cup $x $y
                                 myrowssize=("${#myrows[@]}")
                   mycolsize=("${#mycol[@]}")
                  for((in=0;in<myrowssize;in++))
                  do
                       valx=${myrows[$in]}
                       valy=${mycols[$in]}
                     if((x==valx))
                       then
                        if((y==valy))
                        then
                        

                         if((dflag!=1))
                           then
                               echo -en "\007"
                          print
                        else
                          dflag=0
                        fi
                        fi
                      fi
                    done
               echo '*'
               vyar=$(($y+1))
                tput cup $x $vyar
                echo '>'
                flagup=0
                flagdown=0
                flagleft=0
                flagright=1
                endx=$x
                endy=$vyar
                    myrows=("${myrows[@]}" "$x")
                   mycols=("${mycols[@]}" "$y")
                     clearx=${myrows[0]}
                    cleary=${mycols[0]}
                    if(($snakeclear%8!=0))
                    then
                    tput cup $clearx $cleary
                    myrows=("${myrows[@]:1}")
                    mycols=("${mycols[@]:1}")
                       echo ' '
                    fi  
               tput cup $x $y
}
################################################################################################################################
funcD(){
    ((score++))
    tput setaf 7;
scpos=$(($columns-29))
tput cup 4 $scpos
echo "SCORE : $score"
              tput setaf 2;
              tput cup $endx $endy
                echo ' '
                tput cup $x $y
                color=$(($color%5))
       
                     case $color in
                  0)tput setaf 2 ;;
                  1)tput setaf 4 ;;
                  2)tput setaf 1 ;;
                  3)tput setaf 6 ;;
                  4)tput setaf 7 ;;
                 esac
                y=$(($y-1))
                if(($y<17))
                then
                  echo -en "\007"
                  dflag=1
                 print
                 fi
                tput cup $x $y
                                 myrowssize=("${#myrows[@]}")
                   mycolsize=("${#mycol[@]}")
                  for((in=0;in<myrowssize;in++))
                  do
                       valx=${myrows[$in]}
                       valy=${mycols[$in]}
                     if((x==valx))
                       then
                        if((y==valy))
                        then
                           
                         if((dflag!=1))
                           then
                            echo -en "\007"
                          print
                        else
                          dflag=0
                        fi
                        fi
                      fi
                    done
                echo '*'
                vyar=$(($y-1))
                tput cup $x $vyar
                 echo '<'
                flagright=0
                flagup=0
                flagdown=0
                 flagleft=1
                 endx=$x
                 endy=$vyar
                    myrows=("${myrows[@]}" "$x")
                   mycols=("${mycols[@]}" "$y")
                     clearx=${myrows[0]}
                    cleary=${mycols[0]}
                    if(($snakeclear%8!=0))
                    then
                    tput cup $clearx $cleary
                    myrows=("${myrows[@]:1}")
                    mycols=("${mycols[@]:1}")
                       echo ' '
                    fi  
               tput cup $x $y
}
##############################################################################################################################
print
x=$(($rows/2))
y=$(($columns/2))
prex=$x
prey=$y
k=0
endx=0
starty=0
endy=0
tput setaf 7
spos=$(($y-15))
sxpos=$(($x-3))
blink=1
start=0
  tput cup $sxpos $spos
echo "PRESS ← ↑  ↓  → TO START"

while read -rsn1 pos; do
    case "$pos" in
    $'\x1b')  
         flag=0         
        read -rsn1 -t 0.1 tmp
          
        if [[ "$tmp" == "[" ]]; then
            
            while((1))
            do
             ((snakeclear++))
            read -rsn1 -t 0.1 tmp
            if [ $tmp ];
            then
             ((color++))
              tmp=$tmp
            else
             tmp=$prev
            fi
            if(($start==0))
            then
                tput cup $sxpos $spos
                echo "                              "
                start=1
            fi
            case "$tmp" in
             
            "A") prev=$tmp
                 funcA;;
                   
            "B")prev=$tmp
                funcB;;
         
            "C")prev=$tmp
               funcC;;
             
            "D")prev=$tmp
                   funcD;;
               q|Q)tput reset
                  flag=1
                  break      

            esac
          done
        fi
        if(($flag==1))
        then
          break
        fi
    esac
  done
tput reset

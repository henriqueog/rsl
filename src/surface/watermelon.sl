surface watermelon(
 color baseColor=color(0.56,0.6,0.20);
 float baseColorFreq=2;
 float label=0.5;
 //inicializando as variáveis de sombreamento
 )
{
 color sc;
 //layer 1
 point Pshad = transform("shader",P) * baseColorFreq+label;
 //calcula um simples ruído para dirigir a função spline
 float smallNoise = noise(2 *Pshad);
 //criando variações da color base para passar corretamente para a functio spline
 color dargre=  baseColor-0.025;
 color midargre=baseColor-0.0125;
 color midgre=  baseColor;
 color midligre=baseColor+0.025;
 color lightgre=baseColor+color(0.025,0.025,0);
 //spline function
 //we can spend countless values
 sc= spline(smallNoise,dargre,midargre,midgre,midligre,midligre,midgre,midargre,midgre,midligre,lightgre);
 //plastic shader - basic
 Oi = Os;
 Ci = Oi*sc;
}
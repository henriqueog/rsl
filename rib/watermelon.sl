#include "../src/include/arman/patterns.h"
#include "../src/include/arman/noises.h"

surface watermelon(
color baseColor=color(0.56,0.6,0.41);
float baseColorFreq=2;
float label=0.5;
color stripeColor = color(0.35,0.45,0.31);
float stripeFreq=40 ;
float stripeNoiAmp=0.035;
float stripeNoiLevels=12;
float stripeNoiFreq=5;

//inicializando as variáveis de sombreamento
)
{
color sc,lc;
float lo;
//layer 1
point Pshad = transform("shader",P) * baseColorFreq+label;
//calcula um simples ruído para dirigir a função spline
float smallNoise = noise(2 *Pshad);
//criando variações da color base para passar corretamente para a spline função
color dargre=  baseColor-0.025;
color midargre=baseColor-0.0125;
color midgre=  baseColor;
color midligre=baseColor+0.025;
color lightgre=baseColor+color(0.025,0.025,0);
//spline function
//we can spend countless values
sc= spline(smallNoise,dargre,midargre,midgre,midligre,midligre,midgre,midargre,midgre,midligre,lightgre);

//layer 2 dark green stripes
float width= filterwidthp(Pshad);
float cutoff = clamp(0.5/width,0,stripeNoiLevels);
float f;
float turb=0;
for(f=1;f<0.5*cutoff;f *=2)
 turb +=abs(snoise(Pshad*stripeNoiFreq*f))/f;
 float fade = clamp(2*(cutoff-f)/cutoff,0,1);
 turb +=fade*abs(snoise(Pshad*f))/f;


 float ss=s+snoise(turb+912)*stripeNoiAmp+label;
 lc = stripeColor;
 //use noise para criar longos faixas de ruidos;
 lo = abs(snoisexy(stripeFreq*ss,0.6*t));
 lo = smoothpulse(.1,.3,.74,.94,lo);
 sc = mix(sc,lc,lo);
//plastic shader - basic
Oi = Os;
Ci = Oi*sc;
}
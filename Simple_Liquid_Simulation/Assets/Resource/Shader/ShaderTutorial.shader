Shader "Custom/ShaderTutorial"
{
    Properties
    {
        // _Color = 속성 변수 이름, "Color" = 유니티 내에서 보이는 이름, Color = 속성의 형태, (1,1,1,1) = 순서대로 RGBA 값 지정. 
        _Color ("Red Color", Color) = (1,0,0,1)
    }
    SubShader
    {
        Pass{
            Material{
                Diffuse[_Color]
            }
            Lighting On
        }
    }
    FallBack "Diffuse"
}

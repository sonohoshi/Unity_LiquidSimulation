Shader "Custom/Basic01"
{
    Properties
    {
        // Properties Block : 셰이더에서 사용할 변수를 선언하고 이를 material inspector에 노출시킵니다
        _TintColor("Test Color", color) = (1,1,1,1)
        _Intensity("Range Sample", Range(0,1)) = 0.5
    }

    SubShader
    {
        Tags
        {
            //Render type과 Render Queue를 여기서 결정합니다.
            "RenderPipeline"="UniversalPipeline"
            "RenderType"="Opaque"
            "Queue"="Geometry"
        }
        Pass
        {
            Name "Universal Forward"
            Tags
            {
                "LightMode" = "UniversalForward"
            }

            HLSLPROGRAM
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x
            #pragma vertex vert
            #pragma fragment frag

            //cg shader는 .cginc를 hlsl shader는 .hlsl을 include하게 됩니다.
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

            //vertex buffer에서 읽어올 정보를 선언합니다. 	
            struct VertexInput
            {
                float4 vertex : POSITION;
            };

            //보간기를 통해 버텍스 셰이더에서 픽셀 셰이더로 전달할 정보를 선언합니다.
            struct VertexOutput
            {
                float4 vertex : SV_POSITION;
            };

            half4 _TintColor;
            float _Intensity;

            //버텍스 셰이더
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o;
                o.vertex = TransformObjectToHClip(v.vertex.xyz);

                return o;
            }

            //픽셀 셰이더
            half4 frag(VertexOutput i) : SV_Target
            {
                return half4(_TintColor) * _Intensity;
            }
            ENDHLSL
        }
    }
}
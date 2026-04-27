Shader "Effect/PPX_FX/black_white_shader_lens_URP_Fixed"
{
    Properties
    {
        _threshold("Threshold", Range(0, 1)) = 0.5
        _smooth("Smooth", Range(0, 0.2)) = 0.05
        _flip("Flip Threshold (0.5)", Range(0, 1)) = 0.47
        _white_color("White Color", Color) = (1,1,1,1)
        _black_color("Black Color", Color) = (0,0,0,1)
        [Toggle(_USE_ALPHA_FLIP)] _use_alpha("Use Alpha as Flip", Float) = 0
    }

    SubShader
    {
        Tags 
        { 
            "RenderType" = "Transparent" 
            "Queue" = "Transparent+1000" 
            "RenderPipeline" = "UniversalPipeline"
        }

        Pass
        {
            ZWrite Off
            Cull Off
            Blend SrcAlpha OneMinusSrcAlpha

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature_local _USE_ALPHA_FLIP
            
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareOpaqueTexture.hlsl"

            struct Attributes {
                float4 positionOS : POSITION;
                float4 color : COLOR;
                float2 uv : TEXCOORD0;
            };

            struct Varyings {
                float4 positionCS : SV_POSITION;
                float4 screenPos : TEXCOORD0;
                float4 color : COLOR;
            };

            float _threshold, _smooth, _flip;
            float4 _white_color, _black_color;

            Varyings vert(Attributes input) {
                Varyings output;
                output.positionCS = TransformObjectToHClip(input.positionOS.xyz);
                // URP 스크린 좌표 계산 표준 함수
                output.screenPos = ComputeScreenPos(output.positionCS);
                output.color = input.color;
                return output;
            }

            half4 frag(Varyings input) : SV_Target {
                // 투영 좌표 변환
                float2 uv = input.screenPos.xy / input.screenPos.w;
                
                // 배경 샘플링 (SampleSceneColor 내장 함수 사용)
                half3 screenColor = SampleSceneColor(uv);
                
                // 흑백 공식 (Luminance)
                float grayscale = dot(screenColor, float3(0.2126, 0.7152, 0.0722));
                float stepVal = smoothstep(_threshold, _threshold + _smooth, grayscale);
                
                float fVal = _flip;
                #ifdef _USE_ALPHA_FLIP
                    fVal = input.color.a;
                #endif
                
                float result = (fVal >= 0.5) ? (1.0 - stepVal) : stepVal;
                half4 finalColor = lerp(_black_color, _white_color, result);
                
                // [테스트] 만약 계속 투명하다면 아래 줄의 input.color.a 대신 1.0을 넣어보세요.
                finalColor.a *= input.color.a;
                
                return finalColor;
            }
            ENDHLSL
        }
    }
}
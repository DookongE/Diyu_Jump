// Made with Amplify Shader Editor v1.9.9.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX_BaseShader"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[Toggle( _USE_VERTEXCOLOR_ON )] _Use_VertexColor( "Use_VertexColor", Float ) = 1
		_MainTex( "MainTex", 2D ) = "white" {}
		[Toggle( _MASK_RACHOOSE_ON )] _Mask_RAChoose( "Mask_RAChoose", Float ) = 0
		[Toggle( _USE_MASK_FULLCOLOR_ON )] _Use_Mask_FullColor( "Use_Mask_FullColor", Float ) = 0
		[Toggle( _MASK_OFFSET_UVCHOOSE_ON )] _Mask_Offset_UVChoose( "Mask_Offset_UVChoose", Float ) = 0
		_Mask_Speed( "Mask_Speed", Vector ) = ( 0, 0, 0, 0 )
		[Toggle( _USE_MASK_SSTEP_ON )] _Use_Mask_SStep( "Use_Mask_SStep", Float ) = 0
		_MainTex_SStep( "MainTex_SStep", Vector ) = ( 0, 1, 0, 0 )
		_Emission_Strength( "Emission_Strength", Float ) = 1
		[Toggle( _MASK_FADE_U_ON )] _Mask_Fade_U( "Mask_Fade_U", Float ) = 0
		[Toggle( _MASK_FADE_V_ON )] _Mask_Fade_V( "Mask_Fade_V", Float ) = 0
		[Toggle( _USE_DISSOLVE_ON )] _Use_Dissolve( "Use_Dissolve", Float ) = 0
		_Dissolve_Tex( "Dissolve_Tex", 2D ) = "white" {}
		_Dissolve_Hardness( "Dissolve_Hardness", Float ) = 4
		_Dissolve_Speed( "Dissolve_Speed", Vector ) = ( 0, 0, 0, 0 )
		[Toggle( _DISSOLVE_AFFECTS_MASK_OFFSET_ON )] _Dissolve_Affects_Mask_Offset( "Dissolve_Affects_Mask_Offset", Float ) = 0
		[Toggle( _USE_DISSOLVE_WAY_ON )] _Use_Dissolve_Way( "Use_Dissolve_Way", Float ) = 0
		[Toggle( _DISSOLVE_WAY_UV_CHOOSE_ON )] _Dissolve_Way_UV_Choose( "Dissolve_Way_UV_Choose", Float ) = 0
		_Dissolve_Way_1x_Param( "Dissolve_Way_1-x_Param", Range( 0, 1 ) ) = 0
		[Toggle( _USE_DISSOLVE_LIGHT_ON )] _Use_Dissolve_Light( "Use_Dissolve_Light", Float ) = 0
		_Dissolve_Light_Value( "Dissolve_Light_Value", Float ) = 0.1
		[HDR] _Dissolve_Light_Color( "Dissolve_Light_Color", Color ) = ( 0, 0, 0 )
		[Toggle( _USE_SUBCOLOR_ON )] _Use_SubColor( "Use_SubColor", Float ) = 0
		_SubColor_Tex( "SubColor_Tex", 2D ) = "white" {}
		_SubColor_Speed( "SubColor_Speed", Vector ) = ( 0, 0, 0, 0 )
		[Toggle( _USE_SUBCOLOR_SSTEP_ON )] _Use_SubColor_SStep( "Use_SubColor_SStep", Float ) = 0
		_SubColor_SStep( "SubColor_SStep", Vector ) = ( 0, 1, 0, 0 )
		[Toggle( _USE_SUBCOLOR_FULLCOLOR_ON )] _Use_SubColor_FullColor( "Use_SubColor_FullColor", Float ) = 0
		[Toggle( _USE_SUBCOLOR_AS_NORMAL_ON )] _Use_SubColor_As_Normal( "Use_SubColor_As_Normal", Float ) = 0
		_SubColor_N_LightDirection( "SubColor_N_LightDirection", Vector ) = ( 1, 0, 0, 0 )
		[Toggle( _USE_FLOW_ON )] _Use_Flow( "Use_Flow", Float ) = 0
		_Flow_Tex( "Flow_Tex", 2D ) = "white" {}
		_Flow_Scale( "Flow_Scale", Vector ) = ( 0, 0, 0, 0 )
		[Toggle( _FLOW_SCALE_UVCHOOSE_ON )] _Flow_Scale_UVChoose( "Flow_Scale_UVChoose", Float ) = 0
		_Flow_Speed( "Flow_Speed", Vector ) = ( 0, 0, 0, 0 )
		[Toggle( _FLOW_WORLDPOSITION_ON )] _Flow_WorldPosition( "Flow_WorldPosition", Float ) = 0
		_Flow_WP_Tiling( "Flow_WP_Tiling", Vector ) = ( 0, 0, 0, 0 )
		[Toggle( _SUBCOLOR_AFFECTS_FLOW_ON )] _SubColor_Affects_Flow( "SubColor_Affects_Flow", Float ) = 1
		[Toggle( _DISSOLVE_AFFECTS_FLOW_ON )] _Dissolve_Affects_Flow( "Dissolve_Affects_Flow", Float ) = 0
		[Toggle( _COLOR_AFFECTS_MASK_OFFSET_ON )] _Color_Affects_Mask_Offset( "Color_Affects_Mask_Offset", Float ) = 0
		[Toggle( _USE_CUSTOMDATA_ON )] _Use_CustomData( "Use_CustomData", Float ) = 1
		[Toggle( _USE_RIMLIGHT_ON )] _Use_RimLight( "Use_RimLight", Float ) = 0
		[Toggle( _RIMLIGHT_ONEMINUS_ON )] _RimLight_OneMinus( "RimLight_OneMinus", Float ) = 0
		_RimLight_Factor( "RimLight_Factor", Vector ) = ( 0, 1, 5, 0 )
		[Toggle( _RIMLIGHT_USECUSTOMVIEWDIRECTION_ON )] _RimLight_UseCustomViewDirection( "RimLight_UseCustomViewDirection", Float ) = 0
		_ViewDirection( "ViewDirection", Vector ) = ( 0, 0, 1, 0 )
		[HDR] _MainColor( "MainColor", Color ) = ( 1, 1, 1 )
		_Vtex_U1( "Vtex_U1", Float ) = 0
		_Vtex_V1( "Vtex_V1", Float ) = 0
		_Vtex_W1( "Vtex_W1", Float ) = 0
		_Vtex_T1( "Vtex_T1", Float ) = 0
		[Toggle( _CONTROL_ALPHA_IN_MATERIAL_ON )] _Control_Alpha_In_Material( "Control_Alpha_In_Material", Float ) = 0
		_Alpha( "Alpha", Range( 0, 1 ) ) = 1
		[HDR] _VTex_UVW2( "VTex_UVW2", Color ) = ( 0, 0, 0 )
		[Enum(UnityEngine.Rendering.CullMode)] _Cull( "Cull", Int ) = 0
		[Toggle( _USE_DEPTHFADE_ON )] _Use_DepthFade( "Use_DepthFade", Float ) = 0
		_SoftParticleFactor( "SoftParticleFactor", Float ) = 10


		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		//[ToggleUI] _ReceiveShadows("Receive Shadows", Float) = 1.0
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="Unlit" }

		Cull [_Cull]
		AlphaToMask Off

		Stencil
		{
			Ref [_Stencil_Ref]
			ReadMask [_Stencil_Read]
			WriteMask [_Stencil_Write]
			CompFront [_Stencil_Compare]
			PassFront [_Stencil_Pass]
			FailFront [_Stencil_Fail]
			ZFailFront [_Stencil_ZFail]
			CompBack [_Stencil_Compare]
			PassBack [_Stencil_Pass]
			FailBack [_Stencil_Fail]
			ZFailBack [_Stencil_ZFail]
		}

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#if ( SHADER_TARGET > 35 ) && defined( SHADER_API_GLES3 )
			#error For WebGL2/GLES3, please set your shader target to 3.5 via SubShader options. URP shaders in ASE use target 4.5 by default.
		#endif

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			

			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _RECEIVE_SHADOWS_OFF
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3

			

			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_UNLIT

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
			#if ASE_SRP_VERSION >=140010
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging3D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceData.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES2
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_SCREEN_POSITION_NORMALIZED
			#pragma shader_feature_local _USE_DISSOLVE_LIGHT_ON
			#pragma shader_feature_local _USE_SUBCOLOR_FULLCOLOR_ON
			#pragma shader_feature_local _USE_SUBCOLOR_ON
			#pragma shader_feature_local _USE_MASK_FULLCOLOR_ON
			#pragma shader_feature_local _USE_VERTEXCOLOR_ON
			#pragma shader_feature_local _USE_FLOW_ON
			#pragma shader_feature_local _FLOW_WORLDPOSITION_ON
			#pragma shader_feature_local _FLOW_SCALE_UVCHOOSE_ON
			#pragma shader_feature_local _USE_CUSTOMDATA_ON
			#pragma shader_feature_local _MASK_OFFSET_UVCHOOSE_ON
			#pragma shader_feature_local _USE_SUBCOLOR_SSTEP_ON
			#pragma shader_feature_local _USE_SUBCOLOR_AS_NORMAL_ON
			#pragma shader_feature_local _SUBCOLOR_AFFECTS_FLOW_ON
			#pragma shader_feature_local _COLOR_AFFECTS_MASK_OFFSET_ON
			#pragma shader_feature_local _USE_DISSOLVE_WAY_ON
			#pragma shader_feature_local _DISSOLVE_AFFECTS_FLOW_ON
			#pragma shader_feature_local _DISSOLVE_AFFECTS_MASK_OFFSET_ON
			#pragma shader_feature_local _DISSOLVE_WAY_UV_CHOOSE_ON
			#pragma shader_feature_local _USE_DEPTHFADE_ON
			#pragma shader_feature_local _CONTROL_ALPHA_IN_MATERIAL_ON
			#pragma shader_feature_local _USE_MASK_SSTEP_ON
			#pragma shader_feature_local _MASK_RACHOOSE_ON
			#pragma shader_feature_local _USE_DISSOLVE_ON
			#pragma shader_feature_local _MASK_FADE_U_ON
			#pragma shader_feature_local _MASK_FADE_V_ON
			#pragma shader_feature_local _USE_RIMLIGHT_ON
			#pragma shader_feature_local _RIMLIGHT_ONEMINUS_ON
			#pragma shader_feature_local _RIMLIGHT_USECUSTOMVIEWDIRECTION_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				half4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 positionWSAndFogFactor : TEXCOORD0;
				half3 normalWS : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SubColor_Tex_ST;
			half4 _Flow_Tex_ST;
			half4 _MainTex_ST;
			half4 _Dissolve_Tex_ST;
			half3 _MainColor;
			half3 _RimLight_Factor;
			half3 _Dissolve_Light_Color;
			half3 _SubColor_N_LightDirection;
			half3 _ViewDirection;
			half3 _VTex_UVW2;
			half2 _Dissolve_Speed;
			half2 _SubColor_SStep;
			half2 _SubColor_Speed;
			half2 _MainTex_SStep;
			half2 _Flow_Scale;
			half2 _Flow_WP_Tiling;
			half2 _Flow_Speed;
			half2 _Mask_Speed;
			half _Vtex_V1;
			half _Dissolve_Light_Value;
			half _Dissolve_Hardness;
			int _Cull;
			half _Alpha;
			half _Vtex_U1;
			half _Vtex_T1;
			half _Vtex_W1;
			half _Emission_Strength;
			half _Dissolve_Way_1x_Param;
			half _SoftParticleFactor;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _Flow_Tex;
			sampler2D _SubColor_Tex;
			sampler2D _Dissolve_Tex;


			
			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				half3 ase_tangentWS = TransformObjectToWorldDir( input.ase_tangent.xyz );
				output.ase_texcoord5.xyz = ase_tangentWS;
				half3 ase_normalWS = TransformObjectToWorldNormal( input.normalOS );
				half ase_tangentSign = input.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_bitangentWS = cross( ase_normalWS, ase_tangentWS ) * ase_tangentSign;
				output.ase_texcoord6.xyz = ase_bitangentWS;
				
				output.ase_color = input.ase_color;
				output.ase_texcoord2.xy = input.ase_texcoord.xy;
				output.ase_texcoord3 = input.ase_texcoord1;
				output.ase_texcoord4 = input.ase_texcoord2;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord2.zw = 0;
				output.ase_texcoord5.w = 0;
				output.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS );

				float fogFactor = 0;
				#if defined(ASE_FOG) && !defined(_FOG_FRAGMENT)
					fogFactor = ComputeFogFactor(vertexInput.positionCS.z);
				#endif

				output.positionCS = vertexInput.positionCS;
				output.positionWSAndFogFactor = float4( vertexInput.positionWS, fogFactor );
				output.normalWS = normalInput.normalWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				half4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_texcoord2 = input.ase_texcoord2;
				output.ase_tangent = input.ase_tangent;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				output.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag ( PackedVaryings input
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

				#if defined( _SURFACE_TYPE_TRANSPARENT )
					const bool isTransparent = true;
				#else
					const bool isTransparent = false;
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					float4 shadowCoord = TransformWorldToShadowCoord( input.positionWSAndFogFactor.xyz );
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				float3 PositionWS = input.positionWSAndFogFactor.xyz;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				half3 ViewDirWS = GetWorldSpaceNormalizeViewDir( PositionWS );
				float4 ShadowCoord = shadowCoord;
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );
				half3 NormalWS = normalize( input.normalWS );

				#ifdef _USE_VERTEXCOLOR_ON
				half3 staticSwitch297 = (input.ase_color).rgb;
				#else
				half3 staticSwitch297 = _MainColor;
				#endif
				half3 temp_output_47_0 = ( staticSwitch297 * _Emission_Strength );
				half2 uv_Flow_Tex = input.ase_texcoord2.xy * _Flow_Tex_ST.xy + _Flow_Tex_ST.zw;
				half2 panner38 = ( 1.0 * _Time.y * _Flow_Speed + uv_Flow_Tex);
				half2 panner268 = ( 1.0 * _Time.y * _Flow_Speed + ( (PositionWS).xy * _Flow_WP_Tiling ));
				#ifdef _FLOW_WORLDPOSITION_ON
				half2 staticSwitch271 = (tex2D( _Flow_Tex, panner268 )).rg;
				#else
				half2 staticSwitch271 = (tex2D( _Flow_Tex, panner38 )).rg;
				#endif
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch145 = input.ase_texcoord3.z;
				#else
				half staticSwitch145 = _Vtex_W1;
				#endif
				half2 appendResult120 = (half2(staticSwitch145 , 1.0));
				half2 appendResult121 = (half2(1.0 , staticSwitch145));
				#ifdef _FLOW_SCALE_UVCHOOSE_ON
				half2 staticSwitch122 = appendResult121;
				#else
				half2 staticSwitch122 = appendResult120;
				#endif
				#ifdef _USE_FLOW_ON
				half2 staticSwitch44 = ( staticSwitch271 * _Flow_Scale * staticSwitch122 );
				#else
				half2 staticSwitch44 = half2( 0,0 );
				#endif
				half2 Flow56 = staticSwitch44;
				half2 uv_MainTex = input.ase_texcoord2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch146 = input.ase_texcoord3.w;
				#else
				half staticSwitch146 = _Vtex_T1;
				#endif
				half2 appendResult124 = (half2(staticSwitch146 , 0.0));
				half2 appendResult125 = (half2(0.0 , staticSwitch146));
				#ifdef _MASK_OFFSET_UVCHOOSE_ON
				half2 staticSwitch123 = appendResult125;
				#else
				half2 staticSwitch123 = appendResult124;
				#endif
				half2 temp_output_126_0 = ( staticSwitch123 + float2( 1,1 ) );
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch142 = input.ase_texcoord3.x;
				#else
				half staticSwitch142 = _Vtex_U1;
				#endif
				half2 appendResult16 = (half2(staticSwitch142 , 0.0));
				half2 appendResult17 = (half2(0.0 , staticSwitch142));
				#ifdef _MASK_OFFSET_UVCHOOSE_ON
				half2 staticSwitch15 = appendResult17;
				#else
				half2 staticSwitch15 = appendResult16;
				#endif
				half2 panner199 = ( 1.0 * _Time.y * _Mask_Speed + ( Flow56 + ( ( uv_MainTex * temp_output_126_0 ) + staticSwitch15 ) ));
				half4 tex2DNode10 = tex2D( _MainTex, panner199 );
				half3 temp_output_296_0 = ( ( staticSwitch297 * tex2DNode10.rgb ) * _Emission_Strength );
				#ifdef _USE_MASK_FULLCOLOR_ON
				half3 staticSwitch283 = temp_output_296_0;
				#else
				half3 staticSwitch283 = temp_output_47_0;
				#endif
				#ifdef _USE_MASK_FULLCOLOR_ON
				half3 staticSwitch216 = temp_output_296_0;
				#else
				half3 staticSwitch216 = temp_output_47_0;
				#endif
				#ifdef _USE_CUSTOMDATA_ON
				half3 staticSwitch150 = (input.ase_texcoord4).xyz;
				#else
				half3 staticSwitch150 = _VTex_UVW2;
				#endif
				#ifdef _SUBCOLOR_AFFECTS_FLOW_ON
				half2 staticSwitch59 = Flow56;
				#else
				half2 staticSwitch59 = half2( 0,0 );
				#endif
				half2 uv_SubColor_Tex = input.ase_texcoord2.xy * _SubColor_Tex_ST.xy + _SubColor_Tex_ST.zw;
				#ifdef _COLOR_AFFECTS_MASK_OFFSET_ON
				half2 staticSwitch93 = staticSwitch15;
				#else
				half2 staticSwitch93 = half2( 0,0 );
				#endif
				half2 panner53 = ( 1.0 * _Time.y * _SubColor_Speed + ( staticSwitch59 + ( ( uv_SubColor_Tex * temp_output_126_0 ) + staticSwitch93 ) ));
				half4 tex2DNode50 = tex2D( _SubColor_Tex, panner53 );
				half3 ase_tangentWS = input.ase_texcoord5.xyz;
				float3 ase_bitangentWS = input.ase_texcoord6.xyz;
				half3 tanToWorld0 = float3( ase_tangentWS.x, ase_bitangentWS.x, NormalWS.x );
				half3 tanToWorld1 = float3( ase_tangentWS.y, ase_bitangentWS.y, NormalWS.y );
				half3 tanToWorld2 = float3( ase_tangentWS.z, ase_bitangentWS.z, NormalWS.z );
				float3 tanNormal281 = tex2DNode50.rgb;
				half3 worldNormal281 = float3( dot( tanToWorld0, tanNormal281 ), dot( tanToWorld1, tanNormal281 ), dot( tanToWorld2, tanNormal281 ) );
				half dotResult255 = dot( worldNormal281 , _SubColor_N_LightDirection );
				#ifdef _USE_SUBCOLOR_AS_NORMAL_ON
				half staticSwitch258 = (dotResult255*0.5 + 0.5);
				#else
				half staticSwitch258 = tex2DNode50.r;
				#endif
				half smoothstepResult65 = smoothstep( _SubColor_SStep.x , _SubColor_SStep.y , staticSwitch258);
				#ifdef _USE_SUBCOLOR_SSTEP_ON
				half staticSwitch69 = smoothstepResult65;
				#else
				half staticSwitch69 = staticSwitch258;
				#endif
				half3 lerpResult49 = lerp( staticSwitch216 , staticSwitch150 , staticSwitch69);
				#ifdef _USE_SUBCOLOR_ON
				half3 staticSwitch51 = lerpResult49;
				#else
				half3 staticSwitch51 = staticSwitch283;
				#endif
				#ifdef _USE_SUBCOLOR_FULLCOLOR_ON
				half3 staticSwitch197 = ( staticSwitch297 * tex2DNode50.rgb * _Emission_Strength );
				#else
				half3 staticSwitch197 = staticSwitch51;
				#endif
				half2 uv_Dissolve_Tex = input.ase_texcoord2.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
				half2 MaskOffset294 = staticSwitch15;
				#ifdef _DISSOLVE_AFFECTS_MASK_OFFSET_ON
				half2 staticSwitch292 = ( uv_Dissolve_Tex + MaskOffset294 );
				#else
				half2 staticSwitch292 = uv_Dissolve_Tex;
				#endif
				#ifdef _DISSOLVE_AFFECTS_FLOW_ON
				half2 staticSwitch63 = ( Flow56 + staticSwitch292 );
				#else
				half2 staticSwitch63 = staticSwitch292;
				#endif
				half2 panner34 = ( 1.0 * _Time.y * _Dissolve_Speed + staticSwitch63);
				half4 tex2DNode20 = tex2D( _Dissolve_Tex, panner34 );
				half2 texCoord96 = input.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DISSOLVE_WAY_UV_CHOOSE_ON
				half staticSwitch99 = texCoord96.y;
				#else
				half staticSwitch99 = texCoord96.x;
				#endif
				half lerpResult101 = lerp( staticSwitch99 , ( 1.0 - staticSwitch99 ) , _Dissolve_Way_1x_Param);
				#ifdef _USE_DISSOLVE_WAY_ON
				half staticSwitch103 = ( tex2DNode20.r * lerpResult101 );
				#else
				half staticSwitch103 = tex2DNode20.r;
				#endif
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch144 = input.ase_texcoord3.y;
				#else
				half staticSwitch144 = _Vtex_V1;
				#endif
				half temp_output_25_0 =  (-_Dissolve_Hardness + ( staticSwitch144 - 0.0 ) * ( _Dissolve_Hardness - -_Dissolve_Hardness ) / ( 1.0 - 0.0 ) );
				half temp_output_28_0 = saturate( ( ( staticSwitch103 * _Dissolve_Hardness ) - temp_output_25_0 ) );
				half3 lerpResult194 = lerp( staticSwitch197 , _Dissolve_Light_Color , ( temp_output_28_0 - saturate( ( ( ( tex2DNode20.r + -_Dissolve_Light_Value ) * staticSwitch103 * _Dissolve_Hardness ) - temp_output_25_0 ) ) ));
				#ifdef _USE_DISSOLVE_LIGHT_ON
				half3 staticSwitch196 = lerpResult194;
				#else
				half3 staticSwitch196 = staticSwitch197;
				#endif
				
				#ifdef _MASK_RACHOOSE_ON
				half staticSwitch12 = tex2DNode10.a;
				#else
				half staticSwitch12 = tex2DNode10.r;
				#endif
				half smoothstepResult67 = smoothstep( _MainTex_SStep.x , _MainTex_SStep.y , staticSwitch12);
				#ifdef _USE_MASK_SSTEP_ON
				half staticSwitch70 = smoothstepResult67;
				#else
				half staticSwitch70 = staticSwitch12;
				#endif
				#ifdef _USE_DISSOLVE_ON
				half staticSwitch30 = temp_output_28_0;
				#else
				half staticSwitch30 = 1.0;
				#endif
				half2 texCoord106 = input.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _MASK_FADE_U_ON
				half staticSwitch114 = ( texCoord106.x * ( 1.0 - texCoord106.x ) );
				#else
				half staticSwitch114 = 1.0;
				#endif
				#ifdef _MASK_FADE_V_ON
				half staticSwitch116 = ( texCoord106.y * ( 1.0 - texCoord106.y ) );
				#else
				half staticSwitch116 = 1.0;
				#endif
				#ifdef _RIMLIGHT_USECUSTOMVIEWDIRECTION_ON
				half3 staticSwitch298 = _ViewDirection;
				#else
				half3 staticSwitch298 = ViewDirWS;
				#endif
				half fresnelNdotV176 = dot( NormalWS, staticSwitch298 );
				half fresnelNode176 = ( _RimLight_Factor.x + _RimLight_Factor.y * pow( 1.0 - fresnelNdotV176, _RimLight_Factor.z ) );
				#ifdef _RIMLIGHT_ONEMINUS_ON
				half staticSwitch280 = fresnelNode176;
				#else
				half staticSwitch280 = ( 1.0 - fresnelNode176 );
				#endif
				#ifdef _USE_RIMLIGHT_ON
				half staticSwitch184 = saturate( staticSwitch280 );
				#else
				half staticSwitch184 = 1.0;
				#endif
				half temp_output_261_0 = ( ( ( staticSwitch70 * staticSwitch30 ) * saturate( ( ( staticSwitch114 * staticSwitch116 ) * 50.0 ) ) ) * ( input.ase_color.a * staticSwitch184 ) );
				#ifdef _CONTROL_ALPHA_IN_MATERIAL_ON
				half staticSwitch219 = ( temp_output_261_0 * _Alpha );
				#else
				half staticSwitch219 = temp_output_261_0;
				#endif
				float screenDepth287 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ScreenPosNorm.xy ),_ZBufferParams);
				half distanceDepth287 = saturate( abs( ( screenDepth287 - LinearEyeDepth( ScreenPosNorm.z,_ZBufferParams ) ) / ( _SoftParticleFactor ) ) );
				#ifdef _USE_DEPTHFADE_ON
				half staticSwitch285 = ( staticSwitch219 * distanceDepth287 );
				#else
				half staticSwitch285 = staticSwitch219;
				#endif
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = staticSwitch196;
				float Alpha = staticSwitch285;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#if defined( _ALPHATEST_ON )
					AlphaDiscard( Alpha, AlphaClipThreshold );
				#endif

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_CHANGES_WORLD_POS)
					ShadowCoord = TransformWorldToShadowCoord( PositionWS );
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = PositionWS;
				inputData.positionCS = float4( input.positionCS.xy, ClipPos.zw / ClipPos.w );
				inputData.normalizedScreenSpaceUV = ScreenPosNorm.xy;
				inputData.normalWS = NormalWS;
				inputData.viewDirectionWS = ViewDirWS;

				#ifdef ASE_FOG
					inputData.fogCoord = InitializeInputDataFog(float4(inputData.positionWS, 1.0), input.positionWSAndFogFactor.w);
				#endif

				#if defined(_DBUFFER)
					ApplyDecalToBaseColor(input.positionCS, Color);
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						Color.rgb = MixFogColor(Color.rgb, half3(0,0,0), inputData.fogCoord);
					#else
						Color.rgb = MixFog(Color.rgb, inputData.fogCoord);
					#endif
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				#if defined( ASE_OPAQUE_KEEP_ALPHA )
					return half4( Color, Alpha );
				#else
					return half4( Color, OutputAlpha( Alpha, isTransparent ) );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask R
			AlphaToMask Off

			HLSLPROGRAM

			

			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _RECEIVE_SHADOWS_OFF
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma vertex vert
			#pragma fragment frag

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_SCREEN_POSITION_NORMALIZED
			#pragma shader_feature_local _USE_DEPTHFADE_ON
			#pragma shader_feature_local _CONTROL_ALPHA_IN_MATERIAL_ON
			#pragma shader_feature_local _USE_MASK_SSTEP_ON
			#pragma shader_feature_local _MASK_RACHOOSE_ON
			#pragma shader_feature_local _USE_FLOW_ON
			#pragma shader_feature_local _FLOW_WORLDPOSITION_ON
			#pragma shader_feature_local _FLOW_SCALE_UVCHOOSE_ON
			#pragma shader_feature_local _USE_CUSTOMDATA_ON
			#pragma shader_feature_local _MASK_OFFSET_UVCHOOSE_ON
			#pragma shader_feature_local _USE_DISSOLVE_ON
			#pragma shader_feature_local _USE_DISSOLVE_WAY_ON
			#pragma shader_feature_local _DISSOLVE_AFFECTS_FLOW_ON
			#pragma shader_feature_local _DISSOLVE_AFFECTS_MASK_OFFSET_ON
			#pragma shader_feature_local _DISSOLVE_WAY_UV_CHOOSE_ON
			#pragma shader_feature_local _MASK_FADE_U_ON
			#pragma shader_feature_local _MASK_FADE_V_ON
			#pragma shader_feature_local _USE_RIMLIGHT_ON
			#pragma shader_feature_local _RIMLIGHT_ONEMINUS_ON
			#pragma shader_feature_local _RIMLIGHT_USECUSTOMVIEWDIRECTION_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				half4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SubColor_Tex_ST;
			half4 _Flow_Tex_ST;
			half4 _MainTex_ST;
			half4 _Dissolve_Tex_ST;
			half3 _MainColor;
			half3 _RimLight_Factor;
			half3 _Dissolve_Light_Color;
			half3 _SubColor_N_LightDirection;
			half3 _ViewDirection;
			half3 _VTex_UVW2;
			half2 _Dissolve_Speed;
			half2 _SubColor_SStep;
			half2 _SubColor_Speed;
			half2 _MainTex_SStep;
			half2 _Flow_Scale;
			half2 _Flow_WP_Tiling;
			half2 _Flow_Speed;
			half2 _Mask_Speed;
			half _Vtex_V1;
			half _Dissolve_Light_Value;
			half _Dissolve_Hardness;
			int _Cull;
			half _Alpha;
			half _Vtex_U1;
			half _Vtex_T1;
			half _Vtex_W1;
			half _Emission_Strength;
			half _Dissolve_Way_1x_Param;
			half _SoftParticleFactor;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _Flow_Tex;
			sampler2D _Dissolve_Tex;


			
			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 ase_positionWS = TransformObjectToWorld( ( input.positionOS ).xyz );
				output.ase_texcoord1.xyz = ase_positionWS;
				half3 ase_normalWS = TransformObjectToWorldNormal( input.normalOS );
				output.ase_texcoord3.xyz = ase_normalWS;
				
				output.ase_texcoord.xy = input.ase_texcoord.xy;
				output.ase_texcoord2 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord.zw = 0;
				output.ase_texcoord1.w = 0;
				output.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				half4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );

				half2 uv_Flow_Tex = input.ase_texcoord.xy * _Flow_Tex_ST.xy + _Flow_Tex_ST.zw;
				half2 panner38 = ( 1.0 * _Time.y * _Flow_Speed + uv_Flow_Tex);
				float3 ase_positionWS = input.ase_texcoord1.xyz;
				half2 panner268 = ( 1.0 * _Time.y * _Flow_Speed + ( (ase_positionWS).xy * _Flow_WP_Tiling ));
				#ifdef _FLOW_WORLDPOSITION_ON
				half2 staticSwitch271 = (tex2D( _Flow_Tex, panner268 )).rg;
				#else
				half2 staticSwitch271 = (tex2D( _Flow_Tex, panner38 )).rg;
				#endif
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch145 = input.ase_texcoord2.z;
				#else
				half staticSwitch145 = _Vtex_W1;
				#endif
				half2 appendResult120 = (half2(staticSwitch145 , 1.0));
				half2 appendResult121 = (half2(1.0 , staticSwitch145));
				#ifdef _FLOW_SCALE_UVCHOOSE_ON
				half2 staticSwitch122 = appendResult121;
				#else
				half2 staticSwitch122 = appendResult120;
				#endif
				#ifdef _USE_FLOW_ON
				half2 staticSwitch44 = ( staticSwitch271 * _Flow_Scale * staticSwitch122 );
				#else
				half2 staticSwitch44 = half2( 0,0 );
				#endif
				half2 Flow56 = staticSwitch44;
				half2 uv_MainTex = input.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch146 = input.ase_texcoord2.w;
				#else
				half staticSwitch146 = _Vtex_T1;
				#endif
				half2 appendResult124 = (half2(staticSwitch146 , 0.0));
				half2 appendResult125 = (half2(0.0 , staticSwitch146));
				#ifdef _MASK_OFFSET_UVCHOOSE_ON
				half2 staticSwitch123 = appendResult125;
				#else
				half2 staticSwitch123 = appendResult124;
				#endif
				half2 temp_output_126_0 = ( staticSwitch123 + float2( 1,1 ) );
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch142 = input.ase_texcoord2.x;
				#else
				half staticSwitch142 = _Vtex_U1;
				#endif
				half2 appendResult16 = (half2(staticSwitch142 , 0.0));
				half2 appendResult17 = (half2(0.0 , staticSwitch142));
				#ifdef _MASK_OFFSET_UVCHOOSE_ON
				half2 staticSwitch15 = appendResult17;
				#else
				half2 staticSwitch15 = appendResult16;
				#endif
				half2 panner199 = ( 1.0 * _Time.y * _Mask_Speed + ( Flow56 + ( ( uv_MainTex * temp_output_126_0 ) + staticSwitch15 ) ));
				half4 tex2DNode10 = tex2D( _MainTex, panner199 );
				#ifdef _MASK_RACHOOSE_ON
				half staticSwitch12 = tex2DNode10.a;
				#else
				half staticSwitch12 = tex2DNode10.r;
				#endif
				half smoothstepResult67 = smoothstep( _MainTex_SStep.x , _MainTex_SStep.y , staticSwitch12);
				#ifdef _USE_MASK_SSTEP_ON
				half staticSwitch70 = smoothstepResult67;
				#else
				half staticSwitch70 = staticSwitch12;
				#endif
				half2 uv_Dissolve_Tex = input.ase_texcoord.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
				half2 MaskOffset294 = staticSwitch15;
				#ifdef _DISSOLVE_AFFECTS_MASK_OFFSET_ON
				half2 staticSwitch292 = ( uv_Dissolve_Tex + MaskOffset294 );
				#else
				half2 staticSwitch292 = uv_Dissolve_Tex;
				#endif
				#ifdef _DISSOLVE_AFFECTS_FLOW_ON
				half2 staticSwitch63 = ( Flow56 + staticSwitch292 );
				#else
				half2 staticSwitch63 = staticSwitch292;
				#endif
				half2 panner34 = ( 1.0 * _Time.y * _Dissolve_Speed + staticSwitch63);
				half4 tex2DNode20 = tex2D( _Dissolve_Tex, panner34 );
				half2 texCoord96 = input.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DISSOLVE_WAY_UV_CHOOSE_ON
				half staticSwitch99 = texCoord96.y;
				#else
				half staticSwitch99 = texCoord96.x;
				#endif
				half lerpResult101 = lerp( staticSwitch99 , ( 1.0 - staticSwitch99 ) , _Dissolve_Way_1x_Param);
				#ifdef _USE_DISSOLVE_WAY_ON
				half staticSwitch103 = ( tex2DNode20.r * lerpResult101 );
				#else
				half staticSwitch103 = tex2DNode20.r;
				#endif
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch144 = input.ase_texcoord2.y;
				#else
				half staticSwitch144 = _Vtex_V1;
				#endif
				half temp_output_25_0 =  (-_Dissolve_Hardness + ( staticSwitch144 - 0.0 ) * ( _Dissolve_Hardness - -_Dissolve_Hardness ) / ( 1.0 - 0.0 ) );
				half temp_output_28_0 = saturate( ( ( staticSwitch103 * _Dissolve_Hardness ) - temp_output_25_0 ) );
				#ifdef _USE_DISSOLVE_ON
				half staticSwitch30 = temp_output_28_0;
				#else
				half staticSwitch30 = 1.0;
				#endif
				half2 texCoord106 = input.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _MASK_FADE_U_ON
				half staticSwitch114 = ( texCoord106.x * ( 1.0 - texCoord106.x ) );
				#else
				half staticSwitch114 = 1.0;
				#endif
				#ifdef _MASK_FADE_V_ON
				half staticSwitch116 = ( texCoord106.y * ( 1.0 - texCoord106.y ) );
				#else
				half staticSwitch116 = 1.0;
				#endif
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_positionWS );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				#ifdef _RIMLIGHT_USECUSTOMVIEWDIRECTION_ON
				half3 staticSwitch298 = _ViewDirection;
				#else
				half3 staticSwitch298 = ase_viewDirWS;
				#endif
				half3 ase_normalWS = input.ase_texcoord3.xyz;
				half fresnelNdotV176 = dot( ase_normalWS, staticSwitch298 );
				half fresnelNode176 = ( _RimLight_Factor.x + _RimLight_Factor.y * pow( 1.0 - fresnelNdotV176, _RimLight_Factor.z ) );
				#ifdef _RIMLIGHT_ONEMINUS_ON
				half staticSwitch280 = fresnelNode176;
				#else
				half staticSwitch280 = ( 1.0 - fresnelNode176 );
				#endif
				#ifdef _USE_RIMLIGHT_ON
				half staticSwitch184 = saturate( staticSwitch280 );
				#else
				half staticSwitch184 = 1.0;
				#endif
				half temp_output_261_0 = ( ( ( staticSwitch70 * staticSwitch30 ) * saturate( ( ( staticSwitch114 * staticSwitch116 ) * 50.0 ) ) ) * ( input.ase_color.a * staticSwitch184 ) );
				#ifdef _CONTROL_ALPHA_IN_MATERIAL_ON
				half staticSwitch219 = ( temp_output_261_0 * _Alpha );
				#else
				half staticSwitch219 = temp_output_261_0;
				#endif
				float screenDepth287 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ScreenPosNorm.xy ),_ZBufferParams);
				half distanceDepth287 = saturate( abs( ( screenDepth287 - LinearEyeDepth( ScreenPosNorm.z,_ZBufferParams ) ) / ( _SoftParticleFactor ) ) );
				#ifdef _USE_DEPTHFADE_ON
				half staticSwitch285 = ( staticSwitch219 * distanceDepth287 );
				#else
				half staticSwitch285 = staticSwitch219;
				#endif
				

				float Alpha = staticSwitch285;
				float AlphaClipThreshold = 0.5;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#if defined( _ALPHATEST_ON )
					AlphaDiscard( Alpha, AlphaClipThreshold );
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _RECEIVE_SHADOWS_OFF
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
			#if ASE_SRP_VERSION >=140010
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _USE_DEPTHFADE_ON
			#pragma shader_feature_local _CONTROL_ALPHA_IN_MATERIAL_ON
			#pragma shader_feature_local _USE_MASK_SSTEP_ON
			#pragma shader_feature_local _MASK_RACHOOSE_ON
			#pragma shader_feature_local _USE_FLOW_ON
			#pragma shader_feature_local _FLOW_WORLDPOSITION_ON
			#pragma shader_feature_local _FLOW_SCALE_UVCHOOSE_ON
			#pragma shader_feature_local _USE_CUSTOMDATA_ON
			#pragma shader_feature_local _MASK_OFFSET_UVCHOOSE_ON
			#pragma shader_feature_local _USE_DISSOLVE_ON
			#pragma shader_feature_local _USE_DISSOLVE_WAY_ON
			#pragma shader_feature_local _DISSOLVE_AFFECTS_FLOW_ON
			#pragma shader_feature_local _DISSOLVE_AFFECTS_MASK_OFFSET_ON
			#pragma shader_feature_local _DISSOLVE_WAY_UV_CHOOSE_ON
			#pragma shader_feature_local _MASK_FADE_U_ON
			#pragma shader_feature_local _MASK_FADE_V_ON
			#pragma shader_feature_local _USE_RIMLIGHT_ON
			#pragma shader_feature_local _RIMLIGHT_ONEMINUS_ON
			#pragma shader_feature_local _RIMLIGHT_USECUSTOMVIEWDIRECTION_ON


			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				half4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SubColor_Tex_ST;
			half4 _Flow_Tex_ST;
			half4 _MainTex_ST;
			half4 _Dissolve_Tex_ST;
			half3 _MainColor;
			half3 _RimLight_Factor;
			half3 _Dissolve_Light_Color;
			half3 _SubColor_N_LightDirection;
			half3 _ViewDirection;
			half3 _VTex_UVW2;
			half2 _Dissolve_Speed;
			half2 _SubColor_SStep;
			half2 _SubColor_Speed;
			half2 _MainTex_SStep;
			half2 _Flow_Scale;
			half2 _Flow_WP_Tiling;
			half2 _Flow_Speed;
			half2 _Mask_Speed;
			half _Vtex_V1;
			half _Dissolve_Light_Value;
			half _Dissolve_Hardness;
			int _Cull;
			half _Alpha;
			half _Vtex_U1;
			half _Vtex_T1;
			half _Vtex_W1;
			half _Emission_Strength;
			half _Dissolve_Way_1x_Param;
			half _SoftParticleFactor;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _Flow_Tex;
			sampler2D _Dissolve_Tex;


			
			int _ObjectId;
			int _PassValue;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction(Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 ase_positionWS = TransformObjectToWorld( ( input.positionOS ).xyz );
				output.ase_texcoord1.xyz = ase_positionWS;
				half3 ase_normalWS = TransformObjectToWorldNormal( input.normalOS );
				output.ase_texcoord3.xyz = ase_normalWS;
				float4 ase_positionCS = TransformObjectToHClip( ( input.positionOS ).xyz );
				float4 screenPos = ComputeScreenPos( ase_positionCS );
				output.ase_texcoord4 = screenPos;
				
				output.ase_texcoord.xy = input.ase_texcoord.xy;
				output.ase_texcoord2 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord.zw = 0;
				output.ase_texcoord1.w = 0;
				output.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				half4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input ) : SV_Target
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				half2 uv_Flow_Tex = input.ase_texcoord.xy * _Flow_Tex_ST.xy + _Flow_Tex_ST.zw;
				half2 panner38 = ( 1.0 * _Time.y * _Flow_Speed + uv_Flow_Tex);
				float3 ase_positionWS = input.ase_texcoord1.xyz;
				half2 panner268 = ( 1.0 * _Time.y * _Flow_Speed + ( (ase_positionWS).xy * _Flow_WP_Tiling ));
				#ifdef _FLOW_WORLDPOSITION_ON
				half2 staticSwitch271 = (tex2D( _Flow_Tex, panner268 )).rg;
				#else
				half2 staticSwitch271 = (tex2D( _Flow_Tex, panner38 )).rg;
				#endif
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch145 = input.ase_texcoord2.z;
				#else
				half staticSwitch145 = _Vtex_W1;
				#endif
				half2 appendResult120 = (half2(staticSwitch145 , 1.0));
				half2 appendResult121 = (half2(1.0 , staticSwitch145));
				#ifdef _FLOW_SCALE_UVCHOOSE_ON
				half2 staticSwitch122 = appendResult121;
				#else
				half2 staticSwitch122 = appendResult120;
				#endif
				#ifdef _USE_FLOW_ON
				half2 staticSwitch44 = ( staticSwitch271 * _Flow_Scale * staticSwitch122 );
				#else
				half2 staticSwitch44 = half2( 0,0 );
				#endif
				half2 Flow56 = staticSwitch44;
				half2 uv_MainTex = input.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch146 = input.ase_texcoord2.w;
				#else
				half staticSwitch146 = _Vtex_T1;
				#endif
				half2 appendResult124 = (half2(staticSwitch146 , 0.0));
				half2 appendResult125 = (half2(0.0 , staticSwitch146));
				#ifdef _MASK_OFFSET_UVCHOOSE_ON
				half2 staticSwitch123 = appendResult125;
				#else
				half2 staticSwitch123 = appendResult124;
				#endif
				half2 temp_output_126_0 = ( staticSwitch123 + float2( 1,1 ) );
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch142 = input.ase_texcoord2.x;
				#else
				half staticSwitch142 = _Vtex_U1;
				#endif
				half2 appendResult16 = (half2(staticSwitch142 , 0.0));
				half2 appendResult17 = (half2(0.0 , staticSwitch142));
				#ifdef _MASK_OFFSET_UVCHOOSE_ON
				half2 staticSwitch15 = appendResult17;
				#else
				half2 staticSwitch15 = appendResult16;
				#endif
				half2 panner199 = ( 1.0 * _Time.y * _Mask_Speed + ( Flow56 + ( ( uv_MainTex * temp_output_126_0 ) + staticSwitch15 ) ));
				half4 tex2DNode10 = tex2D( _MainTex, panner199 );
				#ifdef _MASK_RACHOOSE_ON
				half staticSwitch12 = tex2DNode10.a;
				#else
				half staticSwitch12 = tex2DNode10.r;
				#endif
				half smoothstepResult67 = smoothstep( _MainTex_SStep.x , _MainTex_SStep.y , staticSwitch12);
				#ifdef _USE_MASK_SSTEP_ON
				half staticSwitch70 = smoothstepResult67;
				#else
				half staticSwitch70 = staticSwitch12;
				#endif
				half2 uv_Dissolve_Tex = input.ase_texcoord.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
				half2 MaskOffset294 = staticSwitch15;
				#ifdef _DISSOLVE_AFFECTS_MASK_OFFSET_ON
				half2 staticSwitch292 = ( uv_Dissolve_Tex + MaskOffset294 );
				#else
				half2 staticSwitch292 = uv_Dissolve_Tex;
				#endif
				#ifdef _DISSOLVE_AFFECTS_FLOW_ON
				half2 staticSwitch63 = ( Flow56 + staticSwitch292 );
				#else
				half2 staticSwitch63 = staticSwitch292;
				#endif
				half2 panner34 = ( 1.0 * _Time.y * _Dissolve_Speed + staticSwitch63);
				half4 tex2DNode20 = tex2D( _Dissolve_Tex, panner34 );
				half2 texCoord96 = input.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DISSOLVE_WAY_UV_CHOOSE_ON
				half staticSwitch99 = texCoord96.y;
				#else
				half staticSwitch99 = texCoord96.x;
				#endif
				half lerpResult101 = lerp( staticSwitch99 , ( 1.0 - staticSwitch99 ) , _Dissolve_Way_1x_Param);
				#ifdef _USE_DISSOLVE_WAY_ON
				half staticSwitch103 = ( tex2DNode20.r * lerpResult101 );
				#else
				half staticSwitch103 = tex2DNode20.r;
				#endif
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch144 = input.ase_texcoord2.y;
				#else
				half staticSwitch144 = _Vtex_V1;
				#endif
				half temp_output_25_0 =  (-_Dissolve_Hardness + ( staticSwitch144 - 0.0 ) * ( _Dissolve_Hardness - -_Dissolve_Hardness ) / ( 1.0 - 0.0 ) );
				half temp_output_28_0 = saturate( ( ( staticSwitch103 * _Dissolve_Hardness ) - temp_output_25_0 ) );
				#ifdef _USE_DISSOLVE_ON
				half staticSwitch30 = temp_output_28_0;
				#else
				half staticSwitch30 = 1.0;
				#endif
				half2 texCoord106 = input.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _MASK_FADE_U_ON
				half staticSwitch114 = ( texCoord106.x * ( 1.0 - texCoord106.x ) );
				#else
				half staticSwitch114 = 1.0;
				#endif
				#ifdef _MASK_FADE_V_ON
				half staticSwitch116 = ( texCoord106.y * ( 1.0 - texCoord106.y ) );
				#else
				half staticSwitch116 = 1.0;
				#endif
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_positionWS );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				#ifdef _RIMLIGHT_USECUSTOMVIEWDIRECTION_ON
				half3 staticSwitch298 = _ViewDirection;
				#else
				half3 staticSwitch298 = ase_viewDirWS;
				#endif
				half3 ase_normalWS = input.ase_texcoord3.xyz;
				half fresnelNdotV176 = dot( ase_normalWS, staticSwitch298 );
				half fresnelNode176 = ( _RimLight_Factor.x + _RimLight_Factor.y * pow( 1.0 - fresnelNdotV176, _RimLight_Factor.z ) );
				#ifdef _RIMLIGHT_ONEMINUS_ON
				half staticSwitch280 = fresnelNode176;
				#else
				half staticSwitch280 = ( 1.0 - fresnelNode176 );
				#endif
				#ifdef _USE_RIMLIGHT_ON
				half staticSwitch184 = saturate( staticSwitch280 );
				#else
				half staticSwitch184 = 1.0;
				#endif
				half temp_output_261_0 = ( ( ( staticSwitch70 * staticSwitch30 ) * saturate( ( ( staticSwitch114 * staticSwitch116 ) * 50.0 ) ) ) * ( input.ase_color.a * staticSwitch184 ) );
				#ifdef _CONTROL_ALPHA_IN_MATERIAL_ON
				half staticSwitch219 = ( temp_output_261_0 * _Alpha );
				#else
				half staticSwitch219 = temp_output_261_0;
				#endif
				float4 screenPos = input.ase_texcoord4;
				half4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float screenDepth287 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ),_ZBufferParams);
				half distanceDepth287 = saturate( abs( ( screenDepth287 - LinearEyeDepth( ase_positionSSNorm.z,_ZBufferParams ) ) / ( _SoftParticleFactor ) ) );
				#ifdef _USE_DEPTHFADE_ON
				half staticSwitch285 = ( staticSwitch219 * distanceDepth287 );
				#else
				half staticSwitch285 = staticSwitch219;
				#endif
				

				surfaceDescription.Alpha = staticSwitch285;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				half4 outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				return outColor;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			

			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _RECEIVE_SHADOWS_OFF
			#define ASE_VERSION 19905
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT

			#define SHADERPASS SHADERPASS_DEPTHONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
			#if ASE_SRP_VERSION >=140010
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _USE_DEPTHFADE_ON
			#pragma shader_feature_local _CONTROL_ALPHA_IN_MATERIAL_ON
			#pragma shader_feature_local _USE_MASK_SSTEP_ON
			#pragma shader_feature_local _MASK_RACHOOSE_ON
			#pragma shader_feature_local _USE_FLOW_ON
			#pragma shader_feature_local _FLOW_WORLDPOSITION_ON
			#pragma shader_feature_local _FLOW_SCALE_UVCHOOSE_ON
			#pragma shader_feature_local _USE_CUSTOMDATA_ON
			#pragma shader_feature_local _MASK_OFFSET_UVCHOOSE_ON
			#pragma shader_feature_local _USE_DISSOLVE_ON
			#pragma shader_feature_local _USE_DISSOLVE_WAY_ON
			#pragma shader_feature_local _DISSOLVE_AFFECTS_FLOW_ON
			#pragma shader_feature_local _DISSOLVE_AFFECTS_MASK_OFFSET_ON
			#pragma shader_feature_local _DISSOLVE_WAY_UV_CHOOSE_ON
			#pragma shader_feature_local _MASK_FADE_U_ON
			#pragma shader_feature_local _MASK_FADE_V_ON
			#pragma shader_feature_local _USE_RIMLIGHT_ON
			#pragma shader_feature_local _RIMLIGHT_ONEMINUS_ON
			#pragma shader_feature_local _RIMLIGHT_USECUSTOMVIEWDIRECTION_ON


			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				half4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SubColor_Tex_ST;
			half4 _Flow_Tex_ST;
			half4 _MainTex_ST;
			half4 _Dissolve_Tex_ST;
			half3 _MainColor;
			half3 _RimLight_Factor;
			half3 _Dissolve_Light_Color;
			half3 _SubColor_N_LightDirection;
			half3 _ViewDirection;
			half3 _VTex_UVW2;
			half2 _Dissolve_Speed;
			half2 _SubColor_SStep;
			half2 _SubColor_Speed;
			half2 _MainTex_SStep;
			half2 _Flow_Scale;
			half2 _Flow_WP_Tiling;
			half2 _Flow_Speed;
			half2 _Mask_Speed;
			half _Vtex_V1;
			half _Dissolve_Light_Value;
			half _Dissolve_Hardness;
			int _Cull;
			half _Alpha;
			half _Vtex_U1;
			half _Vtex_T1;
			half _Vtex_W1;
			half _Emission_Strength;
			half _Dissolve_Way_1x_Param;
			half _SoftParticleFactor;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _Flow_Tex;
			sampler2D _Dissolve_Tex;


			
			float4 _SelectionID;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction(Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 ase_positionWS = TransformObjectToWorld( ( input.positionOS ).xyz );
				output.ase_texcoord1.xyz = ase_positionWS;
				half3 ase_normalWS = TransformObjectToWorldNormal( input.normalOS );
				output.ase_texcoord3.xyz = ase_normalWS;
				float4 ase_positionCS = TransformObjectToHClip( ( input.positionOS ).xyz );
				float4 screenPos = ComputeScreenPos( ase_positionCS );
				output.ase_texcoord4 = screenPos;
				
				output.ase_texcoord.xy = input.ase_texcoord.xy;
				output.ase_texcoord2 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord.zw = 0;
				output.ase_texcoord1.w = 0;
				output.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				half4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input ) : SV_Target
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				half2 uv_Flow_Tex = input.ase_texcoord.xy * _Flow_Tex_ST.xy + _Flow_Tex_ST.zw;
				half2 panner38 = ( 1.0 * _Time.y * _Flow_Speed + uv_Flow_Tex);
				float3 ase_positionWS = input.ase_texcoord1.xyz;
				half2 panner268 = ( 1.0 * _Time.y * _Flow_Speed + ( (ase_positionWS).xy * _Flow_WP_Tiling ));
				#ifdef _FLOW_WORLDPOSITION_ON
				half2 staticSwitch271 = (tex2D( _Flow_Tex, panner268 )).rg;
				#else
				half2 staticSwitch271 = (tex2D( _Flow_Tex, panner38 )).rg;
				#endif
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch145 = input.ase_texcoord2.z;
				#else
				half staticSwitch145 = _Vtex_W1;
				#endif
				half2 appendResult120 = (half2(staticSwitch145 , 1.0));
				half2 appendResult121 = (half2(1.0 , staticSwitch145));
				#ifdef _FLOW_SCALE_UVCHOOSE_ON
				half2 staticSwitch122 = appendResult121;
				#else
				half2 staticSwitch122 = appendResult120;
				#endif
				#ifdef _USE_FLOW_ON
				half2 staticSwitch44 = ( staticSwitch271 * _Flow_Scale * staticSwitch122 );
				#else
				half2 staticSwitch44 = half2( 0,0 );
				#endif
				half2 Flow56 = staticSwitch44;
				half2 uv_MainTex = input.ase_texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch146 = input.ase_texcoord2.w;
				#else
				half staticSwitch146 = _Vtex_T1;
				#endif
				half2 appendResult124 = (half2(staticSwitch146 , 0.0));
				half2 appendResult125 = (half2(0.0 , staticSwitch146));
				#ifdef _MASK_OFFSET_UVCHOOSE_ON
				half2 staticSwitch123 = appendResult125;
				#else
				half2 staticSwitch123 = appendResult124;
				#endif
				half2 temp_output_126_0 = ( staticSwitch123 + float2( 1,1 ) );
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch142 = input.ase_texcoord2.x;
				#else
				half staticSwitch142 = _Vtex_U1;
				#endif
				half2 appendResult16 = (half2(staticSwitch142 , 0.0));
				half2 appendResult17 = (half2(0.0 , staticSwitch142));
				#ifdef _MASK_OFFSET_UVCHOOSE_ON
				half2 staticSwitch15 = appendResult17;
				#else
				half2 staticSwitch15 = appendResult16;
				#endif
				half2 panner199 = ( 1.0 * _Time.y * _Mask_Speed + ( Flow56 + ( ( uv_MainTex * temp_output_126_0 ) + staticSwitch15 ) ));
				half4 tex2DNode10 = tex2D( _MainTex, panner199 );
				#ifdef _MASK_RACHOOSE_ON
				half staticSwitch12 = tex2DNode10.a;
				#else
				half staticSwitch12 = tex2DNode10.r;
				#endif
				half smoothstepResult67 = smoothstep( _MainTex_SStep.x , _MainTex_SStep.y , staticSwitch12);
				#ifdef _USE_MASK_SSTEP_ON
				half staticSwitch70 = smoothstepResult67;
				#else
				half staticSwitch70 = staticSwitch12;
				#endif
				half2 uv_Dissolve_Tex = input.ase_texcoord.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
				half2 MaskOffset294 = staticSwitch15;
				#ifdef _DISSOLVE_AFFECTS_MASK_OFFSET_ON
				half2 staticSwitch292 = ( uv_Dissolve_Tex + MaskOffset294 );
				#else
				half2 staticSwitch292 = uv_Dissolve_Tex;
				#endif
				#ifdef _DISSOLVE_AFFECTS_FLOW_ON
				half2 staticSwitch63 = ( Flow56 + staticSwitch292 );
				#else
				half2 staticSwitch63 = staticSwitch292;
				#endif
				half2 panner34 = ( 1.0 * _Time.y * _Dissolve_Speed + staticSwitch63);
				half4 tex2DNode20 = tex2D( _Dissolve_Tex, panner34 );
				half2 texCoord96 = input.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DISSOLVE_WAY_UV_CHOOSE_ON
				half staticSwitch99 = texCoord96.y;
				#else
				half staticSwitch99 = texCoord96.x;
				#endif
				half lerpResult101 = lerp( staticSwitch99 , ( 1.0 - staticSwitch99 ) , _Dissolve_Way_1x_Param);
				#ifdef _USE_DISSOLVE_WAY_ON
				half staticSwitch103 = ( tex2DNode20.r * lerpResult101 );
				#else
				half staticSwitch103 = tex2DNode20.r;
				#endif
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch144 = input.ase_texcoord2.y;
				#else
				half staticSwitch144 = _Vtex_V1;
				#endif
				half temp_output_25_0 =  (-_Dissolve_Hardness + ( staticSwitch144 - 0.0 ) * ( _Dissolve_Hardness - -_Dissolve_Hardness ) / ( 1.0 - 0.0 ) );
				half temp_output_28_0 = saturate( ( ( staticSwitch103 * _Dissolve_Hardness ) - temp_output_25_0 ) );
				#ifdef _USE_DISSOLVE_ON
				half staticSwitch30 = temp_output_28_0;
				#else
				half staticSwitch30 = 1.0;
				#endif
				half2 texCoord106 = input.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _MASK_FADE_U_ON
				half staticSwitch114 = ( texCoord106.x * ( 1.0 - texCoord106.x ) );
				#else
				half staticSwitch114 = 1.0;
				#endif
				#ifdef _MASK_FADE_V_ON
				half staticSwitch116 = ( texCoord106.y * ( 1.0 - texCoord106.y ) );
				#else
				half staticSwitch116 = 1.0;
				#endif
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_positionWS );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				#ifdef _RIMLIGHT_USECUSTOMVIEWDIRECTION_ON
				half3 staticSwitch298 = _ViewDirection;
				#else
				half3 staticSwitch298 = ase_viewDirWS;
				#endif
				half3 ase_normalWS = input.ase_texcoord3.xyz;
				half fresnelNdotV176 = dot( ase_normalWS, staticSwitch298 );
				half fresnelNode176 = ( _RimLight_Factor.x + _RimLight_Factor.y * pow( 1.0 - fresnelNdotV176, _RimLight_Factor.z ) );
				#ifdef _RIMLIGHT_ONEMINUS_ON
				half staticSwitch280 = fresnelNode176;
				#else
				half staticSwitch280 = ( 1.0 - fresnelNode176 );
				#endif
				#ifdef _USE_RIMLIGHT_ON
				half staticSwitch184 = saturate( staticSwitch280 );
				#else
				half staticSwitch184 = 1.0;
				#endif
				half temp_output_261_0 = ( ( ( staticSwitch70 * staticSwitch30 ) * saturate( ( ( staticSwitch114 * staticSwitch116 ) * 50.0 ) ) ) * ( input.ase_color.a * staticSwitch184 ) );
				#ifdef _CONTROL_ALPHA_IN_MATERIAL_ON
				half staticSwitch219 = ( temp_output_261_0 * _Alpha );
				#else
				half staticSwitch219 = temp_output_261_0;
				#endif
				float4 screenPos = input.ase_texcoord4;
				half4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float screenDepth287 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ),_ZBufferParams);
				half distanceDepth287 = saturate( abs( ( screenDepth287 - LinearEyeDepth( ase_positionSSNorm.z,_ZBufferParams ) ) / ( _SoftParticleFactor ) ) );
				#ifdef _USE_DEPTHFADE_ON
				half staticSwitch285 = ( staticSwitch219 * distanceDepth287 );
				#else
				half staticSwitch285 = staticSwitch219;
				#endif
				

				surfaceDescription.Alpha = staticSwitch285;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				half4 outColor = 0;
				outColor = unity_SelectionID;

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormalsOnly" }

			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			

        	#pragma multi_compile_instancing
        	#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
        	#define _SURFACE_TYPE_TRANSPARENT 1
        	#define _RECEIVE_SHADOWS_OFF
        	#define ASE_VERSION 19905
        	#define ASE_SRP_VERSION 140011
        	#define REQUIRE_DEPTH_TEXTURE 1


			

        	#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT

			

			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_NORMAL_WS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
			#if ASE_SRP_VERSION >=140010
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

            #if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_SCREEN_POSITION_NORMALIZED
			#pragma shader_feature_local _USE_DEPTHFADE_ON
			#pragma shader_feature_local _CONTROL_ALPHA_IN_MATERIAL_ON
			#pragma shader_feature_local _USE_MASK_SSTEP_ON
			#pragma shader_feature_local _MASK_RACHOOSE_ON
			#pragma shader_feature_local _USE_FLOW_ON
			#pragma shader_feature_local _FLOW_WORLDPOSITION_ON
			#pragma shader_feature_local _FLOW_SCALE_UVCHOOSE_ON
			#pragma shader_feature_local _USE_CUSTOMDATA_ON
			#pragma shader_feature_local _MASK_OFFSET_UVCHOOSE_ON
			#pragma shader_feature_local _USE_DISSOLVE_ON
			#pragma shader_feature_local _USE_DISSOLVE_WAY_ON
			#pragma shader_feature_local _DISSOLVE_AFFECTS_FLOW_ON
			#pragma shader_feature_local _DISSOLVE_AFFECTS_MASK_OFFSET_ON
			#pragma shader_feature_local _DISSOLVE_WAY_UV_CHOOSE_ON
			#pragma shader_feature_local _MASK_FADE_U_ON
			#pragma shader_feature_local _MASK_FADE_V_ON
			#pragma shader_feature_local _USE_RIMLIGHT_ON
			#pragma shader_feature_local _RIMLIGHT_ONEMINUS_ON
			#pragma shader_feature_local _RIMLIGHT_USECUSTOMVIEWDIRECTION_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				half4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				half3 normalWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SubColor_Tex_ST;
			half4 _Flow_Tex_ST;
			half4 _MainTex_ST;
			half4 _Dissolve_Tex_ST;
			half3 _MainColor;
			half3 _RimLight_Factor;
			half3 _Dissolve_Light_Color;
			half3 _SubColor_N_LightDirection;
			half3 _ViewDirection;
			half3 _VTex_UVW2;
			half2 _Dissolve_Speed;
			half2 _SubColor_SStep;
			half2 _SubColor_Speed;
			half2 _MainTex_SStep;
			half2 _Flow_Scale;
			half2 _Flow_WP_Tiling;
			half2 _Flow_Speed;
			half2 _Mask_Speed;
			half _Vtex_V1;
			half _Dissolve_Light_Value;
			half _Dissolve_Hardness;
			int _Cull;
			half _Alpha;
			half _Vtex_U1;
			half _Vtex_T1;
			half _Vtex_W1;
			half _Emission_Strength;
			half _Dissolve_Way_1x_Param;
			half _SoftParticleFactor;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _MainTex;
			sampler2D _Flow_Tex;
			sampler2D _Dissolve_Tex;


			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 ase_positionWS = TransformObjectToWorld( ( input.positionOS ).xyz );
				output.ase_texcoord2.xyz = ase_positionWS;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				output.ase_texcoord3 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.zw = 0;
				output.ase_texcoord2.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS );

				output.positionCS = vertexInput.positionCS;
				output.normalWS = normalInput.normalWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				half4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			void frag(PackedVaryings input
						, out half4 outNormalWS : SV_Target0
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 )
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				half3 NormalWS = normalize( input.normalWS );
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );

				half2 uv_Flow_Tex = input.ase_texcoord1.xy * _Flow_Tex_ST.xy + _Flow_Tex_ST.zw;
				half2 panner38 = ( 1.0 * _Time.y * _Flow_Speed + uv_Flow_Tex);
				float3 ase_positionWS = input.ase_texcoord2.xyz;
				half2 panner268 = ( 1.0 * _Time.y * _Flow_Speed + ( (ase_positionWS).xy * _Flow_WP_Tiling ));
				#ifdef _FLOW_WORLDPOSITION_ON
				half2 staticSwitch271 = (tex2D( _Flow_Tex, panner268 )).rg;
				#else
				half2 staticSwitch271 = (tex2D( _Flow_Tex, panner38 )).rg;
				#endif
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch145 = input.ase_texcoord3.z;
				#else
				half staticSwitch145 = _Vtex_W1;
				#endif
				half2 appendResult120 = (half2(staticSwitch145 , 1.0));
				half2 appendResult121 = (half2(1.0 , staticSwitch145));
				#ifdef _FLOW_SCALE_UVCHOOSE_ON
				half2 staticSwitch122 = appendResult121;
				#else
				half2 staticSwitch122 = appendResult120;
				#endif
				#ifdef _USE_FLOW_ON
				half2 staticSwitch44 = ( staticSwitch271 * _Flow_Scale * staticSwitch122 );
				#else
				half2 staticSwitch44 = half2( 0,0 );
				#endif
				half2 Flow56 = staticSwitch44;
				half2 uv_MainTex = input.ase_texcoord1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch146 = input.ase_texcoord3.w;
				#else
				half staticSwitch146 = _Vtex_T1;
				#endif
				half2 appendResult124 = (half2(staticSwitch146 , 0.0));
				half2 appendResult125 = (half2(0.0 , staticSwitch146));
				#ifdef _MASK_OFFSET_UVCHOOSE_ON
				half2 staticSwitch123 = appendResult125;
				#else
				half2 staticSwitch123 = appendResult124;
				#endif
				half2 temp_output_126_0 = ( staticSwitch123 + float2( 1,1 ) );
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch142 = input.ase_texcoord3.x;
				#else
				half staticSwitch142 = _Vtex_U1;
				#endif
				half2 appendResult16 = (half2(staticSwitch142 , 0.0));
				half2 appendResult17 = (half2(0.0 , staticSwitch142));
				#ifdef _MASK_OFFSET_UVCHOOSE_ON
				half2 staticSwitch15 = appendResult17;
				#else
				half2 staticSwitch15 = appendResult16;
				#endif
				half2 panner199 = ( 1.0 * _Time.y * _Mask_Speed + ( Flow56 + ( ( uv_MainTex * temp_output_126_0 ) + staticSwitch15 ) ));
				half4 tex2DNode10 = tex2D( _MainTex, panner199 );
				#ifdef _MASK_RACHOOSE_ON
				half staticSwitch12 = tex2DNode10.a;
				#else
				half staticSwitch12 = tex2DNode10.r;
				#endif
				half smoothstepResult67 = smoothstep( _MainTex_SStep.x , _MainTex_SStep.y , staticSwitch12);
				#ifdef _USE_MASK_SSTEP_ON
				half staticSwitch70 = smoothstepResult67;
				#else
				half staticSwitch70 = staticSwitch12;
				#endif
				half2 uv_Dissolve_Tex = input.ase_texcoord1.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
				half2 MaskOffset294 = staticSwitch15;
				#ifdef _DISSOLVE_AFFECTS_MASK_OFFSET_ON
				half2 staticSwitch292 = ( uv_Dissolve_Tex + MaskOffset294 );
				#else
				half2 staticSwitch292 = uv_Dissolve_Tex;
				#endif
				#ifdef _DISSOLVE_AFFECTS_FLOW_ON
				half2 staticSwitch63 = ( Flow56 + staticSwitch292 );
				#else
				half2 staticSwitch63 = staticSwitch292;
				#endif
				half2 panner34 = ( 1.0 * _Time.y * _Dissolve_Speed + staticSwitch63);
				half4 tex2DNode20 = tex2D( _Dissolve_Tex, panner34 );
				half2 texCoord96 = input.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DISSOLVE_WAY_UV_CHOOSE_ON
				half staticSwitch99 = texCoord96.y;
				#else
				half staticSwitch99 = texCoord96.x;
				#endif
				half lerpResult101 = lerp( staticSwitch99 , ( 1.0 - staticSwitch99 ) , _Dissolve_Way_1x_Param);
				#ifdef _USE_DISSOLVE_WAY_ON
				half staticSwitch103 = ( tex2DNode20.r * lerpResult101 );
				#else
				half staticSwitch103 = tex2DNode20.r;
				#endif
				#ifdef _USE_CUSTOMDATA_ON
				half staticSwitch144 = input.ase_texcoord3.y;
				#else
				half staticSwitch144 = _Vtex_V1;
				#endif
				half temp_output_25_0 =  (-_Dissolve_Hardness + ( staticSwitch144 - 0.0 ) * ( _Dissolve_Hardness - -_Dissolve_Hardness ) / ( 1.0 - 0.0 ) );
				half temp_output_28_0 = saturate( ( ( staticSwitch103 * _Dissolve_Hardness ) - temp_output_25_0 ) );
				#ifdef _USE_DISSOLVE_ON
				half staticSwitch30 = temp_output_28_0;
				#else
				half staticSwitch30 = 1.0;
				#endif
				half2 texCoord106 = input.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _MASK_FADE_U_ON
				half staticSwitch114 = ( texCoord106.x * ( 1.0 - texCoord106.x ) );
				#else
				half staticSwitch114 = 1.0;
				#endif
				#ifdef _MASK_FADE_V_ON
				half staticSwitch116 = ( texCoord106.y * ( 1.0 - texCoord106.y ) );
				#else
				half staticSwitch116 = 1.0;
				#endif
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_positionWS );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				#ifdef _RIMLIGHT_USECUSTOMVIEWDIRECTION_ON
				half3 staticSwitch298 = _ViewDirection;
				#else
				half3 staticSwitch298 = ase_viewDirWS;
				#endif
				half fresnelNdotV176 = dot( NormalWS, staticSwitch298 );
				half fresnelNode176 = ( _RimLight_Factor.x + _RimLight_Factor.y * pow( 1.0 - fresnelNdotV176, _RimLight_Factor.z ) );
				#ifdef _RIMLIGHT_ONEMINUS_ON
				half staticSwitch280 = fresnelNode176;
				#else
				half staticSwitch280 = ( 1.0 - fresnelNode176 );
				#endif
				#ifdef _USE_RIMLIGHT_ON
				half staticSwitch184 = saturate( staticSwitch280 );
				#else
				half staticSwitch184 = 1.0;
				#endif
				half temp_output_261_0 = ( ( ( staticSwitch70 * staticSwitch30 ) * saturate( ( ( staticSwitch114 * staticSwitch116 ) * 50.0 ) ) ) * ( input.ase_color.a * staticSwitch184 ) );
				#ifdef _CONTROL_ALPHA_IN_MATERIAL_ON
				half staticSwitch219 = ( temp_output_261_0 * _Alpha );
				#else
				half staticSwitch219 = temp_output_261_0;
				#endif
				float screenDepth287 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ScreenPosNorm.xy ),_ZBufferParams);
				half distanceDepth287 = saturate( abs( ( screenDepth287 - LinearEyeDepth( ScreenPosNorm.z,_ZBufferParams ) ) / ( _SoftParticleFactor ) ) );
				#ifdef _USE_DEPTHFADE_ON
				half staticSwitch285 = ( staticSwitch219 * distanceDepth287 );
				#else
				half staticSwitch285 = staticSwitch219;
				#endif
				

				float Alpha = staticSwitch285;
				float AlphaClipThreshold = 0.5;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(NormalWS);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					outNormalWS = half4(NormalizeNormalPerPixel( NormalWS ), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4(EncodeMeshRenderingLayer(renderingLayers), 0, 0, 0);
				#endif
			}
			ENDHLSL
		}

	
	}
	
	CustomEditor "UnityEditor.ShaderGraphUnlitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19905
Node;AmplifyShaderEditor.WorldPosInputsNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;265;-3872,-240;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ComponentMaskNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;266;-3632,-224;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;272;-3696,-128;Inherit;False;Property;_Flow_WP_Tiling;Flow_WP_Tiling;36;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;37;-3584,-480;Inherit;False;0;36;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;39;-3440,-336;Inherit;False;Property;_Flow_Speed;Flow_Speed;34;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;267;-3392,-176;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;148;-3008,192;Inherit;False;Property;_Vtex_W1;Vtex_W1;49;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;38;-3216,-432;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;13;-3472,176;Inherit;False;1;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;268;-3185.537,-174.6118;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;36;-3008,-512;Inherit;True;Property;_Flow_Tex;Flow_Tex;31;0;Create;True;0;0;0;False;0;False;-1;db1bf06771db9fc4caa749ff3ca8a9f6;db1bf06771db9fc4caa749ff3ca8a9f6;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;263;-2992,-288;Inherit;True;Property;_Flow_Tex1;Flow_Tex;31;0;Create;True;0;0;0;False;0;False;-1;db1bf06771db9fc4caa749ff3ca8a9f6;db1bf06771db9fc4caa749ff3ca8a9f6;True;0;False;white;Auto;False;Instance;36;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;145;-2752,240;Inherit;False;Property;_Use_CustomData2;Use_CustomData;40;0;Create;True;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Reference;142;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;294;-1392,192;Inherit;False;MaskOffset;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;149;-2992,320;Inherit;False;Property;_Vtex_T1;Vtex_T1;50;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;120;-2288,48;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;121;-2288,160;Inherit;False;FLOAT2;4;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;269;-2576,-224;Inherit;False;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;40;-2576,-496;Inherit;False;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;295;-4000,736;Inherit;False;294;MaskOffset;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;33;-3968,544;Inherit;False;0;20;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;146;-2720,352;Inherit;False;Property;_Use_CustomData3;Use_CustomData;40;0;Create;True;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Reference;142;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;143;-3072,48;Inherit;False;Property;_Vtex_U1;Vtex_U1;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;122;-2080,0;Inherit;False;Property;_Flow_Scale_UVChoose;Flow_Scale_UVChoose;33;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;271;-2288,-432;Inherit;False;Property;_Flow_WorldPosition;Flow_WorldPosition;35;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;42;-2432,-144;Inherit;False;Property;_Flow_Scale;Flow_Scale;32;0;Create;True;0;0;0;False;0;False;0,0;0,-0.39;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;291;-3728,704;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;125;-2096,288;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;124;-2080,192;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;62;-3632,592;Inherit;False;56;Flow;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;142;-2736,0;Inherit;False;Property;_Use_CustomData;Use_CustomData;40;0;Create;True;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;45;-2064,-336;Inherit;False;Constant;_Vector0;Vector 0;11;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;41;-2192,-240;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;292;-3536,688;Inherit;False;Property;_Dissolve_Affects_Mask_Offset;Dissolve_Affects_Mask_Offset;15;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;123;-1760,288;Inherit;False;Property;_Mask_Offset_UVChoose1;Mask_Offset_UVChoose;4;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;15;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;96;-2384,976;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;290;-3228.999,666.7052;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;16;-1728,80;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;17;-1728,192;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;44;-1856,-272;Inherit;False;Property;_Use_Flow;Use_Flow;30;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;63;-3040,576;Inherit;False;Property;_Dissolve_Affects_Flow;Dissolve_Affects_Flow;38;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;18;-1408,80;Inherit;False;0;10;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;126;-1392,304;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;35;-2832,848;Inherit;False;Property;_Dissolve_Speed;Dissolve_Speed;14;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;99;-2144,1056;Inherit;False;Property;_Dissolve_Way_UV_Choose;Dissolve_Way_UV_Choose;17;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;102;-1776,1216;Inherit;False;Property;_Dissolve_Way_1x_Param;Dissolve_Way_1-x_Param;18;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;100;-1776,1104;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;15;-1696,176;Inherit;False;Property;_Mask_Offset_UVChoose;Mask_Offset_UVChoose;4;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;56;-1616,-208;Half;False;Flow;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;127;-1152,192;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;34;-2464,768;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;101;-1552,1056;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;19;-1024,304;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;57;-1168,80;Inherit;False;56;Flow;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;20;-1696,656;Inherit;True;Property;_Dissolve_Tex;Dissolve_Tex;12;0;Create;True;0;0;0;False;0;False;-1;fe7f0c6c1a7dedb4a88f4be342959901;24c31476ff51748468f55ab865c41ccc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;106;688,592;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;147;-3120,96;Inherit;False;Property;_Vtex_V1;Vtex_V1;48;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;284;-1440,1024;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;299;576,912;Inherit;False;Property;_ViewDirection;ViewDirection;45;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;300;416,832;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;43;-896,256;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;23;-2096,528;Inherit;False;Property;_Dissolve_Hardness;Dissolve_Hardness;13;0;Create;True;0;0;0;False;0;False;4;16;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;200;-1152,384;Inherit;False;Property;_Mask_Speed;Mask_Speed;5;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.NegateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;26;-1808,448;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;108;957.8842,689.8502;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;107;912,608;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;144;-2720,144;Inherit;False;Property;_Use_CustomData1;Use_CustomData;40;0;Create;True;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Reference;142;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;181;880,928;Inherit;False;Property;_RimLight_Factor;RimLight_Factor;43;0;Create;True;0;0;0;False;0;False;0,1,5;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;103;-1312,992;Inherit;False;Property;_Use_Dissolve_Way;Use_Dissolve_Way;16;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;298;848,816;Inherit;False;Property;_RimLight_UseCustomViewDirection;RimLight_UseCustomViewDirection;44;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;199;-832,368;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TFHCRemapNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;25;-1648,432;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;112;1104,512;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;113;1116.884,686.8502;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;115;1248,608;Inherit;False;Constant;_Float2;Float 2;26;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;22;-1312,544;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;176;1264,864;Inherit;True;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;6.44;False;2;FLOAT;9.17;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;10;-656,192;Inherit;True;Property;_MainTex;MainTex;1;0;Create;True;0;0;0;False;0;False;-1;291eee9a5bd0e944596acafc9040f0b8;291eee9a5bd0e944596acafc9040f0b8;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;21;-1040,512;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;68;-320,368;Inherit;False;Property;_MainTex_SStep;MainTex_SStep;7;0;Create;True;0;0;0;False;0;False;0,1;0,0.4;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;116;1456,688;Inherit;False;Property;_Mask_Fade_V;Mask_Fade_V;10;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;114;1456,544;Inherit;False;Property;_Mask_Fade_U;Mask_Fade_U;9;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;180;1632,816;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;12;-352,272;Inherit;False;Property;_Mask_RAChoose;Mask_RAChoose;2;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;28;-783.5969,539.2236;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;31;-624,480;Inherit;False;Constant;_Float0;Float 0;6;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;117;1807.884,600.8502;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;67;-64,352;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;280;1760,912;Inherit;False;Property;_RimLight_OneMinus;RimLight_OneMinus;42;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;30;-465.0969,515.8236;Inherit;False;Property;_Use_Dissolve;Use_Dissolve;11;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;70;288,304;Inherit;False;Property;_Use_Mask_SStep;Use_Mask_SStep;6;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;118;2000,640;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;50;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;185;2048,800;Inherit;False;Constant;_Float3;Float 3;36;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;183;1872,816;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;29;816,304;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;119;2224,624;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;184;2224,864;Inherit;False;Property;_Use_RimLight;Use_RimLight;41;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;46;-576,-320;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;105;2528,384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;260;2528,592;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;218;1840,560;Inherit;False;Property;_Alpha;Alpha;52;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;288;2767.85,709.5557;Inherit;False;Property;_SoftParticleFactor;SoftParticleFactor;56;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;261;2730.859,486.7382;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;262;2896,544;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;287;3024,672;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;219;3056,400;Inherit;False;Property;_Control_Alpha_In_Material;Control_Alpha_In_Material;51;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;286;3353.942,614.7762;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;64;-3264,464;Inherit;False;Constant;_Vector2;Vector 2;17;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.IntNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;242;-2317.565,-894.9351;Inherit;False;Property;_Cull;Cull;54;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;220;1968,464;Inherit;False;Constant;_Float4;Float 4;45;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;94;-1623.982,6.430359;Inherit;False;Constant;_Vector3;Vector 3;22;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;93;-1456,16;Inherit;False;Property;_Color_Affects_Mask_Offset;Color_Affects_Mask_Offset;39;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;188;-1712,848;Inherit;False;Property;_Dissolve_Light_Value;Dissolve_Light_Value;20;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;193;-1387.041,888.7739;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;187;-1120,800;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;189;-960,800;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;190;-784,736;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;191;-551.9297,788.5548;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;192;-272,656;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;54;-1056,-32;Inherit;False;Property;_SubColor_Speed;SubColor_Speed;24;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;60;-1376,-592;Inherit;False;Constant;_Vector1;Vector 1;16;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;58;-1424,-480;Inherit;False;56;Flow;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;53;-528,-64;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;128;-1296,-176;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;55;-688,-432;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;59;-1008,-464;Inherit;False;Property;_SubColor_Affects_Flow;SubColor_Affects_Flow;37;0;Create;True;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;52;-1552,-304;Inherit;False;0;50;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;92;-1136,-176;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;194;2752,80;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;197;2368,0;Inherit;False;Property;_Use_SubColor_FullColor;Use_SubColor_FullColor;27;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;66;96,208;Inherit;False;Property;_SubColor_SStep;SubColor_SStep;26;0;Create;True;0;0;0;False;0;False;0,1;0,0.21;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector3Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;256;272,368;Inherit;False;Property;_SubColor_N_LightDirection;SubColor_N_LightDirection;29;0;Create;True;0;0;0;False;0;False;1,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;258;752,16;Inherit;False;Property;_Use_SubColor_As_Normal;Use_SubColor_As_Normal;28;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;257;736,160;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;255;576,144;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;281;160,160;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;50;-304,112;Inherit;True;Property;_SubColor_Tex;SubColor_Tex;23;0;Create;True;0;0;0;False;0;False;-1;3f15bab1bb4c3c34d97385724edd6b09;3f15bab1bb4c3c34d97385724edd6b09;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;False;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;195;2272,128;Inherit;False;Property;_Dissolve_Light_Color;Dissolve_Light_Color;21;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;150;512,-16;Inherit;False;Property;_Keyword0;Keyword 0;40;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;142;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;14;-16,16;Inherit;False;2;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;254;224,16;Inherit;False;True;True;True;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;151;320,80;Inherit;False;Property;_VTex_UVW2;VTex_UVW2;53;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;48;-240,-144;Inherit;False;Property;_Emission_Strength;Emission_Strength;8;0;Create;True;0;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;47;352,-352;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;51;2064,-160;Inherit;True;Property;_Use_SubColor;Use_SubColor;22;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;196;3056,16;Inherit;True;Property;_Use_Dissolve_Light;Use_Dissolve_Light;19;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;69;1440,128;Inherit;False;Property;_Use_SubColor_SStep;Use_SubColor_SStep;25;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;49;1792,-32;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;65;1168,176;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;198;560,-128;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;283;1040,-384;Inherit;True;Property;_Keyword1;Keyword 1;3;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;216;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;216;1024,-160;Inherit;False;Property;_Use_Mask_FullColor;Use_Mask_FullColor;3;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;104;-1584,992;Inherit;False;Constant;_Float1;Float 1;25;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;285;3515.634,505.1548;Inherit;False;Property;_Use_DepthFade;Use_DepthFade;55;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;296;300.2884,-215.5615;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;186;-352,-560;Inherit;False;Property;_MainColor;MainColor;46;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;217;112,-288;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;282;-400,-336;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;297;-80,-384;Inherit;False;Property;_Use_VertexColor;Use_VertexColor;0;0;Create;True;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;232;3776,256;Half;False;True;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;16;FX_BaseShader;2992e84f91cbeb14eab234972e07ea9d;True;Forward;0;1;Forward;9;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;2;True;_Cull;False;False;False;False;False;False;False;False;True;True;True;0;True;_Stencil_Ref;255;True;_Stencil_Read;255;True;_Stencil_Write;0;True;_Stencil_Compare;0;True;_Stencil_Pass;0;True;_Stencil_Fail;0;True;_Stencil_ZFail;0;True;_Stencil_Compare;0;True;_Stencil_Pass;0;True;_Stencil_Fail;0;True;_Stencil_ZFail;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;True;True;False;0;True;_Stencil_Ref;255;True;_Stencil_Read;255;True;_Stencil_Write;0;True;_Stencil_Compare;0;True;_Stencil_Pass;0;True;_Stencil_Fail;0;True;_Stencil_ZFail;0;True;_Stencil_Compare;0;True;_Stencil_Pass;0;True;_Stencil_Fail;0;True;_Stencil_ZFail;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;27;Surface;1;638665408209028889;  Keep Alpha;0;0;  Blend;0;0;Two Sided;0;638674256215195186;Alpha Clipping;0;638972771782524029;  Use Shadow Threshold;0;0;Forward Only;0;0;Cast Shadows;0;638668175949354556;Receive Shadows;0;638668175954310333;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;0;638668175970710833;Meta Pass;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position;1;0;0;10;False;True;False;True;False;False;True;True;True;False;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;231;3008,224;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;233;3008,176;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;234;3008,176;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;235;3008,176;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;236;3008,176;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;237;3008,176;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;238;3008,176;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;239;3008,176;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormals;0;8;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;240;3008,176;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormalsOnly;0;9;DepthNormalsOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;;0;0;Standard;0;False;0
WireConnection;266;0;265;0
WireConnection;267;0;266;0
WireConnection;267;1;272;0
WireConnection;38;0;37;0
WireConnection;38;2;39;0
WireConnection;268;0;267;0
WireConnection;268;2;39;0
WireConnection;36;1;38;0
WireConnection;263;1;268;0
WireConnection;145;1;148;0
WireConnection;145;0;13;3
WireConnection;294;0;15;0
WireConnection;120;0;145;0
WireConnection;121;1;145;0
WireConnection;269;0;263;0
WireConnection;40;0;36;0
WireConnection;146;1;149;0
WireConnection;146;0;13;4
WireConnection;122;1;120;0
WireConnection;122;0;121;0
WireConnection;271;1;40;0
WireConnection;271;0;269;0
WireConnection;291;0;33;0
WireConnection;291;1;295;0
WireConnection;125;1;146;0
WireConnection;124;0;146;0
WireConnection;142;1;143;0
WireConnection;142;0;13;1
WireConnection;41;0;271;0
WireConnection;41;1;42;0
WireConnection;41;2;122;0
WireConnection;292;1;33;0
WireConnection;292;0;291;0
WireConnection;123;1;124;0
WireConnection;123;0;125;0
WireConnection;290;0;62;0
WireConnection;290;1;292;0
WireConnection;16;0;142;0
WireConnection;17;1;142;0
WireConnection;44;1;45;0
WireConnection;44;0;41;0
WireConnection;63;1;292;0
WireConnection;63;0;290;0
WireConnection;126;0;123;0
WireConnection;99;1;96;1
WireConnection;99;0;96;2
WireConnection;100;0;99;0
WireConnection;15;1;16;0
WireConnection;15;0;17;0
WireConnection;56;0;44;0
WireConnection;127;0;18;0
WireConnection;127;1;126;0
WireConnection;34;0;63;0
WireConnection;34;2;35;0
WireConnection;101;0;99;0
WireConnection;101;1;100;0
WireConnection;101;2;102;0
WireConnection;19;0;127;0
WireConnection;19;1;15;0
WireConnection;20;1;34;0
WireConnection;284;0;20;1
WireConnection;284;1;101;0
WireConnection;43;0;57;0
WireConnection;43;1;19;0
WireConnection;26;0;23;0
WireConnection;108;0;106;2
WireConnection;107;0;106;1
WireConnection;144;1;147;0
WireConnection;144;0;13;2
WireConnection;103;1;20;1
WireConnection;103;0;284;0
WireConnection;298;1;300;0
WireConnection;298;0;299;0
WireConnection;199;0;43;0
WireConnection;199;2;200;0
WireConnection;25;0;144;0
WireConnection;25;3;26;0
WireConnection;25;4;23;0
WireConnection;112;0;106;1
WireConnection;112;1;107;0
WireConnection;113;0;106;2
WireConnection;113;1;108;0
WireConnection;22;0;103;0
WireConnection;22;1;23;0
WireConnection;176;4;298;0
WireConnection;176;1;181;1
WireConnection;176;2;181;2
WireConnection;176;3;181;3
WireConnection;10;1;199;0
WireConnection;21;0;22;0
WireConnection;21;1;25;0
WireConnection;116;1;115;0
WireConnection;116;0;113;0
WireConnection;114;1;115;0
WireConnection;114;0;112;0
WireConnection;180;0;176;0
WireConnection;12;1;10;1
WireConnection;12;0;10;4
WireConnection;28;0;21;0
WireConnection;117;0;114;0
WireConnection;117;1;116;0
WireConnection;67;0;12;0
WireConnection;67;1;68;1
WireConnection;67;2;68;2
WireConnection;280;1;180;0
WireConnection;280;0;176;0
WireConnection;30;1;31;0
WireConnection;30;0;28;0
WireConnection;70;1;12;0
WireConnection;70;0;67;0
WireConnection;118;0;117;0
WireConnection;183;0;280;0
WireConnection;29;0;70;0
WireConnection;29;1;30;0
WireConnection;119;0;118;0
WireConnection;184;1;185;0
WireConnection;184;0;183;0
WireConnection;105;0;29;0
WireConnection;105;1;119;0
WireConnection;260;0;46;4
WireConnection;260;1;184;0
WireConnection;261;0;105;0
WireConnection;261;1;260;0
WireConnection;262;0;261;0
WireConnection;262;1;218;0
WireConnection;287;0;288;0
WireConnection;219;1;261;0
WireConnection;219;0;262;0
WireConnection;286;0;219;0
WireConnection;286;1;287;0
WireConnection;93;1;94;0
WireConnection;93;0;15;0
WireConnection;193;0;188;0
WireConnection;187;0;20;1
WireConnection;187;1;193;0
WireConnection;189;0;187;0
WireConnection;189;1;103;0
WireConnection;189;2;23;0
WireConnection;190;0;189;0
WireConnection;190;1;25;0
WireConnection;191;0;190;0
WireConnection;192;0;28;0
WireConnection;192;1;191;0
WireConnection;53;0;55;0
WireConnection;53;2;54;0
WireConnection;128;0;52;0
WireConnection;128;1;126;0
WireConnection;55;0;59;0
WireConnection;55;1;92;0
WireConnection;59;1;60;0
WireConnection;59;0;58;0
WireConnection;92;0;128;0
WireConnection;92;1;93;0
WireConnection;194;0;197;0
WireConnection;194;1;195;0
WireConnection;194;2;192;0
WireConnection;197;1;51;0
WireConnection;197;0;198;0
WireConnection;258;1;50;1
WireConnection;258;0;257;0
WireConnection;257;0;255;0
WireConnection;255;0;281;0
WireConnection;255;1;256;0
WireConnection;281;0;50;5
WireConnection;50;1;53;0
WireConnection;150;1;151;0
WireConnection;150;0;254;0
WireConnection;254;0;14;0
WireConnection;47;0;297;0
WireConnection;47;1;48;0
WireConnection;51;1;283;0
WireConnection;51;0;49;0
WireConnection;196;1;197;0
WireConnection;196;0;194;0
WireConnection;69;1;258;0
WireConnection;69;0;65;0
WireConnection;49;0;216;0
WireConnection;49;1;150;0
WireConnection;49;2;69;0
WireConnection;65;0;258;0
WireConnection;65;1;66;1
WireConnection;65;2;66;2
WireConnection;198;0;297;0
WireConnection;198;1;50;5
WireConnection;198;2;48;0
WireConnection;283;1;47;0
WireConnection;283;0;296;0
WireConnection;216;1;47;0
WireConnection;216;0;296;0
WireConnection;285;1;219;0
WireConnection;285;0;286;0
WireConnection;296;0;217;0
WireConnection;296;1;48;0
WireConnection;217;0;297;0
WireConnection;217;1;10;5
WireConnection;282;0;46;0
WireConnection;297;1;186;0
WireConnection;297;0;282;0
WireConnection;232;2;196;0
WireConnection;232;3;285;0
ASEEND*/
//CHKSM=538FFB8BC3DD1ED5EC2CFDDAC801AA74AFD081FA
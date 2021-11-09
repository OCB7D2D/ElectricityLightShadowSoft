using DMT;
using HarmonyLib;
using System.Reflection;
using UnityEngine;

public class OcbElectricitySoftLightShadows
{
    // Entry class for Harmony patching
    public class OcbElectricitySoftLightShadows_Init : IHarmony
    {
        public void Start()
        {
            Debug.Log("Loading OCB Electricity Soft Light Shadows Patch: " + GetType().ToString());
            var harmony = new Harmony(GetType().ToString());
            harmony.PatchAll(Assembly.GetExecutingAssembly());
        }
    }

    [HarmonyPatch(typeof (LightLOD))]
    [HarmonyPatch("GetLight")]
    public class LightLOD_GetLight
    {
        public static void Postfix(ref LightShadows ___shadowStateMaster, Light ___myLight)
        {
            ___shadowStateMaster = LightShadows.Soft;
            if (___myLight != null) {
                ___myLight.shadows = LightShadows.Soft;
            }
        }
    }

}
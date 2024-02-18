package de.thekorn.xandr

import XandrHostApi
import android.app.Activity
import com.appnexus.opensdk.XandrAd
import de.thekorn.xandr.listeners.AdInitListener
import de.thekorn.xandr.listeners.XandrInterstitialAdListener
import de.thekorn.xandr.models.FlutterState
import de.thekorn.xandr.models.ads.InterstitialAd
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import kotlinx.coroutines.ExperimentalCoroutinesApi

class XandrPlugin : FlutterPlugin, ActivityAware, XandrHostApi {
    private lateinit var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding

    private lateinit var flutterState: FlutterState

    // TODO: move to hashmap
    private lateinit var interstitialAd: InterstitialAd

    private lateinit var activity: Activity

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        this.flutterState = FlutterState(binding.applicationContext, binding.binaryMessenger)
        this.flutterState.startListening(this)
        this.flutterPluginBinding = binding
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        this.flutterState.stopListening()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        Log.d(
            "Xandr",
            "--> onAttachedToActivity"
        )
        activity = binding.activity
        this.flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "de.thekorn.xandr/ad_banner",
            BannerViewFactory(
                activity,
                this.flutterState
            )
        )
    }

    override fun onDetachedFromActivityForConfigChanges() {
        Log.d(
            "Xandr",
            "--> onDetachedFromActivityForConfigChanges"
        )
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        Log.d(
            "Xandr",
            "--> onReattachedToActivityForConfigChanges"
        )
        onDetachedFromActivity()
    }

    override fun onDetachedFromActivity() {
        Log.d(
            "Xandr",
            "--> onDetachedFromActivity"
        )
        onDetachedFromActivity()
    }

    @OptIn(ExperimentalCoroutinesApi::class)
    override fun init(memberId: Long, callback: (Result<Boolean>) -> Unit) {
        this.flutterState.memberId = memberId.toInt()
        XandrAd.init(
            memberId.toInt(),
            this.flutterState.applicationContext,
            true,
            true,
            AdInitListener(this.flutterState)
        )
        this.flutterState.isInitialized.invokeOnCompletion {
            callback(Result.success(this.flutterState.isInitialized.getCompleted()))
        }
    }

    override fun loadAd(widgetId: Long, callback: (Result<Boolean>) -> Unit) {
        Log.d("Xandr", "loadAd got called, with widgetId=$widgetId")
        this.flutterState.isInitialized.invokeOnCompletion {
            val ad = this.flutterState.getBannerView(widgetId.toInt())
            Log.d("Xandr", "loadAd found ad for widgetId=$widgetId, ad=$ad")
            ad.loadAd()
            callback(Result.success(true))
        }
    }

    override fun loadInterstitialAd(
        widgetId: Long,
        placementID: String?,
        inventoryCode: String?,
        customKeywords: Map<String, String>?,
        callback: (Result<Boolean>) -> Unit
    ) {
        interstitialAd = InterstitialAd(activity)
        interstitialAd.adListener = XandrInterstitialAdListener(
            widgetId,
            this.flutterState.flutterApi,
            interstitialAd
        )
        customKeywords?.forEach {
            interstitialAd.addCustomKeywords(it.key, it.value)
        }

        this.flutterState.isInitialized.invokeOnCompletion {
            // / need to make sure the sdk is initialized to access the memberId
            // / docs: Note that if both inventory code and placement ID are passed in, the
            //        inventory code will be passed to the server instead of the placement ID.
            if (inventoryCode != null) {
                interstitialAd.setInventoryCodeAndMemberID(flutterState.memberId, inventoryCode)
            } else {
                interstitialAd.placementID = placementID
            }
            interstitialAd.loadAd()
            Log.d("Xandr.Interstitial", "Loading DONE")
            interstitialAd.isLoaded.invokeOnCompletion {
                callback(Result.success(interstitialAd.isLoaded.getCompleted()))
            }
        }
    }

    override fun showInterstitialAd(autoDismissDelay: Long?, callback: (Result<Boolean>) -> Unit) {
        if (interstitialAd.isClosed.isCompleted) {
            callback(Result.success(false))
            return
        }

        interstitialAd.isLoaded.invokeOnCompletion {
            if (autoDismissDelay == null) {
                interstitialAd.show()
            } else {
                interstitialAd.showWithAutoDismissDelay(autoDismissDelay.toInt())
            }
            Log.d("Xandr.Interstitial", "show")
        }
        interstitialAd.isClosed.invokeOnCompletion {
            callback(Result.success(interstitialAd.isClosed.getCompleted()))
        }
    }
}

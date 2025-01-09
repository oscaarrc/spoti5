; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [340 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [674 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 257
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 294
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 6: Newtonsoft.Json.dll => 0x254c520 => 193
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 10: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 335
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 192
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 276
	i32 117431740, ; 15: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 16: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 276
	i32 122350210, ; 17: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 298
	i32 142721839, ; 19: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 231
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 278
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 332
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 333
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 229
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 31: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 251
	i32 230752869, ; 32: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 33: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 34: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 35: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 36: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 234
	i32 266337479, ; 37: Xamarin.Google.Guava.FailureAccess.dll => 0xfdffcc7 => 293
	i32 276479776, ; 38: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 39: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 253
	i32 280482487, ; 40: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 250
	i32 280992041, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 304
	i32 291076382, ; 42: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 293579439, ; 43: ExoPlayer.Dash.dll => 0x117faaaf => 205
	i32 298918909, ; 44: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 45: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 332
	i32 318968648, ; 46: Xamarin.AndroidX.Activity.dll => 0x13031348 => 220
	i32 321597661, ; 47: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 48: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 317
	i32 342366114, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 252
	i32 347068432, ; 50: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 200
	i32 356389973, ; 51: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 316
	i32 360082299, ; 52: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 53: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 54: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 55: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 56: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 57: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 58: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 59: _Microsoft.Android.Resource.Designer => 0x17969339 => 336
	i32 403441872, ; 60: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 61: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 328
	i32 441335492, ; 62: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 235
	i32 442565967, ; 63: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 64: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 248
	i32 451504562, ; 65: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 452127346, ; 66: ExoPlayer.Database.dll => 0x1af2ea72 => 206
	i32 453861648, ; 67: SpotifyClone.dll => 0x1b0d6110 => 0
	i32 456227837, ; 68: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 69: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 70: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 71: System.dll => 0x1bff388e => 164
	i32 476646585, ; 72: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 250
	i32 486930444, ; 73: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 263
	i32 498788369, ; 74: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 75: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 315
	i32 503918385, ; 76: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 309
	i32 513247710, ; 77: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 186
	i32 526420162, ; 78: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 79: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 298
	i32 530272170, ; 80: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 81: Microsoft.Extensions.Logging => 0x20216150 => 182
	i32 540030774, ; 82: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 83: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 84: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 85: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 86: Jsr305Binding => 0x213954e7 => 289
	i32 567300564, ; 87: SpotifyClone => 0x21d051d4 => 0
	i32 569601784, ; 88: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 287
	i32 577335427, ; 89: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 585300633, ; 90: NSoup.Standard.dll => 0x22e2fa99 => 194
	i32 592146354, ; 91: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 323
	i32 601371474, ; 92: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 93: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 94: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 95: Xamarin.AndroidX.CustomView => 0x2568904f => 240
	i32 627931235, ; 96: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 321
	i32 639843206, ; 97: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 246
	i32 643868501, ; 98: System.Net => 0x2660a755 => 81
	i32 662205335, ; 99: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 100: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 283
	i32 666292255, ; 101: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 227
	i32 672442732, ; 102: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 103: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 104: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 303
	i32 690569205, ; 105: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 106: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 300
	i32 693804605, ; 107: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 108: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 109: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 295
	i32 700358131, ; 110: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 111: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 318
	i32 709557578, ; 112: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 306
	i32 710618163, ; 113: Json.More => 0x2a5b2c33 => 175
	i32 720511267, ; 114: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 299
	i32 722857257, ; 115: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 116: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 748832960, ; 117: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 198
	i32 752232764, ; 118: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 119: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 217
	i32 759451189, ; 120: MediaManager => 0x2d444e35 => 196
	i32 759454413, ; 121: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 122: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 123: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 124: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 327
	i32 789151979, ; 125: Microsoft.Extensions.Options => 0x2f0980eb => 185
	i32 790371945, ; 126: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 241
	i32 804715423, ; 127: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 128: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 255
	i32 812693636, ; 129: ExoPlayer.Dash => 0x3070b884 => 205
	i32 823281589, ; 130: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 131: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 132: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 133: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 134: Xamarin.AndroidX.Print => 0x3246f6cd => 269
	i32 873119928, ; 135: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 136: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 137: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 138: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 139: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 915551335, ; 140: ExoPlayer.Ext.MediaSession => 0x36923467 => 211
	i32 926902833, ; 141: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 330
	i32 928116545, ; 142: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 294
	i32 939704684, ; 143: ExoPlayer.Extractor => 0x3802c16c => 209
	i32 952186615, ; 144: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 145: Newtonsoft.Json => 0x38f24a24 => 193
	i32 956575887, ; 146: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 299
	i32 966729478, ; 147: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 290
	i32 967690846, ; 148: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 252
	i32 975236339, ; 149: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 150: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 151: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 152: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 153: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 154: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 155: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 156: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 273
	i32 1019214401, ; 157: System.Drawing => 0x3cbffa41 => 36
	i32 1028013380, ; 158: ExoPlayer.UI.dll => 0x3d463d44 => 215
	i32 1028951442, ; 159: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 181
	i32 1029334545, ; 160: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 305
	i32 1031528504, ; 161: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 291
	i32 1035644815, ; 162: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 225
	i32 1036536393, ; 163: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 164: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 165: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 259
	i32 1067306892, ; 166: GoogleGson => 0x3f9dcf8c => 174
	i32 1077869217, ; 167: Json.More.dll => 0x403efaa1 => 175
	i32 1082857460, ; 168: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 169: Xamarin.Kotlin.StdLib => 0x409e66d8 => 296
	i32 1098259244, ; 170: System => 0x41761b2c => 164
	i32 1118262833, ; 171: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 318
	i32 1121599056, ; 172: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 258
	i32 1127624469, ; 173: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 184
	i32 1149092582, ; 174: Xamarin.AndroidX.Window => 0x447dc2e6 => 286
	i32 1151313727, ; 175: ExoPlayer.Rtsp => 0x449fa73f => 212
	i32 1168523401, ; 176: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 324
	i32 1170634674, ; 177: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 178: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 282
	i32 1178241025, ; 179: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 267
	i32 1179519184, ; 180: MediaManager.Forms => 0x464e08d0 => 197
	i32 1203215381, ; 181: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 322
	i32 1204270330, ; 182: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 227
	i32 1208641965, ; 183: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1214827643, ; 184: CommunityToolkit.Mvvm => 0x4868cc7b => 173
	i32 1219128291, ; 185: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 186: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 320
	i32 1243150071, ; 187: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 287
	i32 1253011324, ; 188: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 189: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 304
	i32 1263886435, ; 190: Xamarin.Google.Guava.dll => 0x4b556063 => 292
	i32 1264511973, ; 191: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 277
	i32 1267360935, ; 192: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 281
	i32 1273260888, ; 193: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 232
	i32 1275534314, ; 194: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 300
	i32 1278448581, ; 195: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 224
	i32 1292207520, ; 196: SQLitePCLRaw.core.dll => 0x4d0585a0 => 199
	i32 1293217323, ; 197: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 243
	i32 1309188875, ; 198: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1309209905, ; 199: ExoPlayer.DataSource => 0x4e08f531 => 207
	i32 1322716291, ; 200: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 286
	i32 1324164729, ; 201: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 202: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1347751866, ; 203: Plugin.Maui.Audio => 0x50550fba => 195
	i32 1364015309, ; 204: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 205: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 334
	i32 1376866003, ; 206: Xamarin.AndroidX.SavedState => 0x52114ed3 => 273
	i32 1379779777, ; 207: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1395857551, ; 208: Xamarin.AndroidX.Media.dll => 0x5333188f => 264
	i32 1402170036, ; 209: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 210: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 236
	i32 1406299041, ; 211: Xamarin.Google.Guava.FailureAccess => 0x53d26ba1 => 293
	i32 1408764838, ; 212: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 213: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 214: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 215: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 302
	i32 1434145427, ; 216: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 217: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 290
	i32 1436510490, ; 218: JsonPath.Net.dll => 0x559f691a => 176
	i32 1439761251, ; 219: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 220: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 221: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 222: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 223: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 224: es\Microsoft.Maui.Controls.resources => 0x57152abe => 308
	i32 1461234159, ; 225: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 226: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 227: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 228: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 226
	i32 1470490898, ; 229: Microsoft.Extensions.Primitives => 0x57a5e912 => 186
	i32 1479771757, ; 230: System.Collections.Immutable => 0x5833866d => 9
	i32 1480156764, ; 231: ExoPlayer.DataSource.dll => 0x5839665c => 207
	i32 1480492111, ; 232: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 233: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 234: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 274
	i32 1490351284, ; 235: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 177
	i32 1493001747, ; 236: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 312
	i32 1514721132, ; 237: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 307
	i32 1536373174, ; 238: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 239: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 240: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 241: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 242: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 327
	i32 1565862583, ; 243: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 244: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 245: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 246: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 247: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 242
	i32 1592978981, ; 248: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 249: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 291
	i32 1601112923, ; 250: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 251: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 252: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 253: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 262
	i32 1622358360, ; 254: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 255: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 285
	i32 1635184631, ; 256: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 246
	i32 1636350590, ; 257: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 239
	i32 1639515021, ; 258: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 259: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 260: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 261: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 262: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 279
	i32 1658251792, ; 263: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 288
	i32 1670060433, ; 264: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 234
	i32 1675553242, ; 265: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 266: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 267: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 268: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1688112883, ; 269: Microsoft.Data.Sqlite => 0x649e8ef3 => 177
	i32 1691477237, ; 270: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 271: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 272: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 297
	i32 1700397376, ; 273: ExoPlayer.Transformer => 0x655a0140 => 214
	i32 1701541528, ; 274: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 275: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 200
	i32 1720223769, ; 276: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 255
	i32 1726116996, ; 277: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 278: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 279: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 230
	i32 1736233607, ; 280: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 325
	i32 1743415430, ; 281: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 303
	i32 1744735666, ; 282: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 283: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 284: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 285: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 286: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765620304, ; 287: ExoPlayer.Core => 0x693d3a50 => 204
	i32 1765942094, ; 288: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 289: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 278
	i32 1770582343, ; 290: Microsoft.Extensions.Logging.dll => 0x6988f147 => 182
	i32 1776026572, ; 291: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 292: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 293: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 294: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 319
	i32 1788241197, ; 295: Xamarin.AndroidX.Fragment => 0x6a96652d => 248
	i32 1793755602, ; 296: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 311
	i32 1808609942, ; 297: Xamarin.AndroidX.Loader => 0x6bcd3296 => 262
	i32 1813058853, ; 298: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 296
	i32 1813201214, ; 299: Xamarin.Google.Android.Material => 0x6c13413e => 288
	i32 1818569960, ; 300: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 268
	i32 1818787751, ; 301: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 302: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 303: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 304: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 183
	i32 1842015223, ; 305: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 331
	i32 1847515442, ; 306: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 217
	i32 1850226322, ; 307: MediaManager.dll => 0x6e483692 => 196
	i32 1853025655, ; 308: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 328
	i32 1858542181, ; 309: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 310: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 311: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 310
	i32 1879696579, ; 312: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 313: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 228
	i32 1888955245, ; 314: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 315: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 316: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 317: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 318: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 319: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 320: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 321: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 275
	i32 1968388702, ; 322: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 178
	i32 1983156543, ; 323: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 297
	i32 1984283898, ; 324: ExoPlayer.Ext.MediaSession.dll => 0x7645c4fa => 211
	i32 1985761444, ; 325: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 219
	i32 2003115576, ; 326: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 307
	i32 2011961780, ; 327: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 328: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 259
	i32 2025202353, ; 329: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 302
	i32 2031763787, ; 330: Xamarin.Android.Glide => 0x791a414b => 216
	i32 2045470958, ; 331: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 332: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 254
	i32 2060060697, ; 333: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 334: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 306
	i32 2070888862, ; 335: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 336: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 337: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2103459038, ; 338: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 201
	i32 2106312818, ; 339: ExoPlayer.Decoder => 0x7d8bc872 => 208
	i32 2113912252, ; 340: ExoPlayer.UI => 0x7dffbdbc => 215
	i32 2127167465, ; 341: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 342: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 343: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 344: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 345: Microsoft.Maui => 0x80bd55ad => 190
	i32 2169148018, ; 346: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 314
	i32 2181898931, ; 347: Microsoft.Extensions.Options.dll => 0x820d22b3 => 185
	i32 2192057212, ; 348: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 183
	i32 2193016926, ; 349: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 350: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 301
	i32 2201231467, ; 351: System.Net.Http => 0x8334206b => 64
	i32 2202964214, ; 352: ExoPlayer.dll => 0x834e90f6 => 202
	i32 2207618523, ; 353: it\Microsoft.Maui.Controls.resources => 0x839595db => 316
	i32 2217644978, ; 354: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 282
	i32 2222056684, ; 355: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2239138732, ; 356: ExoPlayer.SmoothStreaming => 0x85768bac => 213
	i32 2244775296, ; 357: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 263
	i32 2252106437, ; 358: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 359: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 360: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 361: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 179
	i32 2267999099, ; 362: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 218
	i32 2270573516, ; 363: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 310
	i32 2279755925, ; 364: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 271
	i32 2293034957, ; 365: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 366: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2297326322, ; 367: MediaManager.Forms.dll => 0x88ee6af2 => 197
	i32 2298471582, ; 368: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 369: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 320
	i32 2305521784, ; 370: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 371: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 222
	i32 2320631194, ; 372: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 373: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 374: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 375: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 376: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 377: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 178
	i32 2378619854, ; 378: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 379: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 380: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 315
	i32 2401565422, ; 381: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 382: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 245
	i32 2421380589, ; 383: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 384: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 232
	i32 2427813419, ; 385: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 312
	i32 2435356389, ; 386: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 387: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 388: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 389: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 390: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465273461, ; 391: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 198
	i32 2465532216, ; 392: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 235
	i32 2471841756, ; 393: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 394: Java.Interop.dll => 0x93918882 => 168
	i32 2476233210, ; 395: ExoPlayer => 0x939851fa => 202
	i32 2480646305, ; 396: Microsoft.Maui.Controls => 0x93dba8a1 => 188
	i32 2483903535, ; 397: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 398: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 399: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 400: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 401: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 257
	i32 2515854816, ; 402: ExoPlayer.Common => 0x95f4e5e0 => 203
	i32 2522472828, ; 403: Xamarin.Android.Glide.dll => 0x9659e17c => 216
	i32 2538310050, ; 404: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 405: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 313
	i32 2562349572, ; 406: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 407: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 408: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 258
	i32 2581819634, ; 409: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 281
	i32 2585220780, ; 410: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 411: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 412: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 413: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 322
	i32 2605712449, ; 414: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 301
	i32 2615233544, ; 415: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 249
	i32 2616218305, ; 416: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 184
	i32 2617129537, ; 417: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 418: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 419: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 239
	i32 2624644809, ; 420: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 244
	i32 2626028643, ; 421: ExoPlayer.Rtsp.dll => 0x9c860463 => 212
	i32 2626831493, ; 422: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 317
	i32 2627185994, ; 423: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 424: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 425: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 253
	i32 2663391936, ; 426: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 218
	i32 2663698177, ; 427: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 428: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 429: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 430: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 431: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 432: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 433: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 279
	i32 2713040075, ; 434: ExoPlayer.Hls => 0xa1b5b4cb => 210
	i32 2715334215, ; 435: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 436: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 437: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 438: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 439: Xamarin.AndroidX.Activity => 0xa2e0939b => 220
	i32 2735172069, ; 440: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 441: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 226
	i32 2740948882, ; 442: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 443: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 444: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 323
	i32 2758225723, ; 445: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 189
	i32 2764765095, ; 446: Microsoft.Maui.dll => 0xa4caf7a7 => 190
	i32 2765824710, ; 447: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 448: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 295
	i32 2778768386, ; 449: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 284
	i32 2779977773, ; 450: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 272
	i32 2785988530, ; 451: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 329
	i32 2788224221, ; 452: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 249
	i32 2796087574, ; 453: ExoPlayer.Extractor.dll => 0xa6a8e916 => 209
	i32 2801831435, ; 454: Microsoft.Maui.Graphics => 0xa7008e0b => 192
	i32 2803228030, ; 455: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 456: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 308
	i32 2810250172, ; 457: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 236
	i32 2819470561, ; 458: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 459: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 460: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 272
	i32 2824502124, ; 461: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 462: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 321
	i32 2838993487, ; 463: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 260
	i32 2849599387, ; 464: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 465: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 284
	i32 2855708567, ; 466: Xamarin.AndroidX.Transition => 0xaa36a797 => 280
	i32 2861098320, ; 467: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 468: Microsoft.Maui.Essentials => 0xaa8a4878 => 191
	i32 2870099610, ; 469: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 221
	i32 2875164099, ; 470: Jsr305Binding.dll => 0xab5f85c3 => 289
	i32 2875220617, ; 471: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 472: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 247
	i32 2887636118, ; 473: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 474: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 475: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 476: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 477: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 478: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 479: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 285
	i32 2919462931, ; 480: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 481: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 223
	i32 2936416060, ; 482: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 483: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 484: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 485: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2960379616, ; 486: Xamarin.Google.Guava => 0xb073cee0 => 292
	i32 2968338931, ; 487: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 488: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 489: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 243
	i32 2987532451, ; 490: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 275
	i32 2996846495, ; 491: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 256
	i32 3016983068, ; 492: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 277
	i32 3023353419, ; 493: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 494: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 251
	i32 3027462113, ; 495: ExoPlayer.Common.dll => 0xb47367e1 => 203
	i32 3038032645, ; 496: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 336
	i32 3056245963, ; 497: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 274
	i32 3057625584, ; 498: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 265
	i32 3059408633, ; 499: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 500: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 501: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 502: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 314
	i32 3090735792, ; 503: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 504: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 505: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 506: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 507: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 508: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 509: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3144327419, ; 510: ExoPlayer.Hls.dll => 0xbb6aa0fb => 210
	i32 3147165239, ; 511: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 512: GoogleGson.dll => 0xbba64c02 => 174
	i32 3159123045, ; 513: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 514: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 515: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 266
	i32 3190271366, ; 516: ExoPlayer.Decoder.dll => 0xbe27ad86 => 208
	i32 3192346100, ; 517: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 518: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 519: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 520: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 521: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 242
	i32 3220365878, ; 522: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 523: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 524: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3256944405, ; 525: NSoup.Standard => 0xc2210715 => 194
	i32 3258312781, ; 526: Xamarin.AndroidX.CardView => 0xc235e84d => 230
	i32 3265493905, ; 527: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 528: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 529: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 530: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 531: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 532: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 533: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 534: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 535: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 309
	i32 3316684772, ; 536: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 537: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 240
	i32 3317144872, ; 538: System.Data => 0xc5b79d28 => 24
	i32 3329734229, ; 539: ExoPlayer.Database => 0xc677b655 => 206
	i32 3340431453, ; 540: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 228
	i32 3345895724, ; 541: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 270
	i32 3346324047, ; 542: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 267
	i32 3357674450, ; 543: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 326
	i32 3358260929, ; 544: System.Text.Json => 0xc82afec1 => 137
	i32 3360279109, ; 545: SQLitePCLRaw.core => 0xc849ca45 => 199
	i32 3362336904, ; 546: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 221
	i32 3362522851, ; 547: Xamarin.AndroidX.Core => 0xc86c06e3 => 237
	i32 3366347497, ; 548: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 549: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 271
	i32 3381016424, ; 550: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 305
	i32 3395150330, ; 551: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3396979385, ; 552: ExoPlayer.Transformer.dll => 0xca79cab9 => 214
	i32 3403906625, ; 553: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 554: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 241
	i32 3428513518, ; 555: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 180
	i32 3429136800, ; 556: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 557: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 558: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 244
	i32 3445260447, ; 559: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 560: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 187
	i32 3463511458, ; 561: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 313
	i32 3471940407, ; 562: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 563: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 564: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 326
	i32 3484440000, ; 565: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 325
	i32 3485117614, ; 566: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 567: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 568: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 233
	i32 3509114376, ; 569: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 570: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 571: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 572: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 573: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 574: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 575: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 333
	i32 3597029428, ; 576: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 219
	i32 3598340787, ; 577: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 578: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 579: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 580: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 269
	i32 3633644679, ; 581: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 223
	i32 3638274909, ; 582: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 583: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 254
	i32 3643446276, ; 584: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 330
	i32 3643854240, ; 585: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 266
	i32 3645089577, ; 586: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 587: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 179
	i32 3660523487, ; 588: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3660726404, ; 589: Plugin.Maui.Audio.dll => 0xda324084 => 195
	i32 3672681054, ; 590: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 591: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 229
	i32 3684561358, ; 592: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 233
	i32 3697841164, ; 593: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 335
	i32 3700866549, ; 594: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 595: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 238
	i32 3716563718, ; 596: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 597: Xamarin.AndroidX.Annotation => 0xdda814c6 => 222
	i32 3724971120, ; 598: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 265
	i32 3732100267, ; 599: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 600: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 601: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 602: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3754567612, ; 603: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 201
	i32 3786282454, ; 604: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 231
	i32 3792276235, ; 605: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 606: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 187
	i32 3802395368, ; 607: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 608: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3822602673, ; 609: Xamarin.AndroidX.Media => 0xe3d849b1 => 264
	i32 3823082795, ; 610: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 611: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 612: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 181
	i32 3844307129, ; 613: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 614: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 615: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 616: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 617: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 618: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 619: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 280
	i32 3888767677, ; 620: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 270
	i32 3889960447, ; 621: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 334
	i32 3896106733, ; 622: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 623: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 237
	i32 3901907137, ; 624: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 625: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 626: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 283
	i32 3928044579, ; 627: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 628: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 629: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 268
	i32 3945713374, ; 630: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 631: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 632: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 225
	i32 3959773229, ; 633: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 256
	i32 3980434154, ; 634: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 329
	i32 3987592930, ; 635: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 311
	i32 4003436829, ; 636: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 637: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 224
	i32 4025784931, ; 638: System.Memory => 0xeff49a63 => 62
	i32 4044355444, ; 639: JsonPath.Net => 0xf10ff774 => 176
	i32 4046471985, ; 640: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 189
	i32 4054681211, ; 641: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 642: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 643: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 644: Microsoft.Maui.Essentials.dll => 0xf40add04 => 191
	i32 4099507663, ; 645: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 646: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 647: Xamarin.AndroidX.Emoji2 => 0xf479582c => 245
	i32 4102112229, ; 648: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 324
	i32 4125707920, ; 649: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 319
	i32 4126470640, ; 650: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 180
	i32 4127667938, ; 651: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 652: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 653: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 654: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 331
	i32 4151237749, ; 655: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 656: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 657: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 658: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4173364138, ; 659: ExoPlayer.SmoothStreaming.dll => 0xf8c07baa => 213
	i32 4181436372, ; 660: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 661: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 261
	i32 4185676441, ; 662: System.Security => 0xf97c5a99 => 130
	i32 4190597220, ; 663: ExoPlayer.Core.dll => 0xf9c77064 => 204
	i32 4196529839, ; 664: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 665: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 666: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 238
	i32 4258378803, ; 667: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 260
	i32 4260525087, ; 668: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 669: Microsoft.Maui.Controls.dll => 0xfea12dee => 188
	i32 4274623895, ; 670: CommunityToolkit.Mvvm.dll => 0xfec99597 => 173
	i32 4274976490, ; 671: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 672: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 261
	i32 4294763496 ; 673: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 247
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [674 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 257, ; 3
	i32 294, ; 4
	i32 48, ; 5
	i32 193, ; 6
	i32 80, ; 7
	i32 145, ; 8
	i32 30, ; 9
	i32 335, ; 10
	i32 124, ; 11
	i32 192, ; 12
	i32 102, ; 13
	i32 276, ; 14
	i32 107, ; 15
	i32 276, ; 16
	i32 139, ; 17
	i32 298, ; 18
	i32 77, ; 19
	i32 124, ; 20
	i32 13, ; 21
	i32 231, ; 22
	i32 132, ; 23
	i32 278, ; 24
	i32 151, ; 25
	i32 332, ; 26
	i32 333, ; 27
	i32 18, ; 28
	i32 229, ; 29
	i32 26, ; 30
	i32 251, ; 31
	i32 1, ; 32
	i32 59, ; 33
	i32 42, ; 34
	i32 91, ; 35
	i32 234, ; 36
	i32 293, ; 37
	i32 147, ; 38
	i32 253, ; 39
	i32 250, ; 40
	i32 304, ; 41
	i32 54, ; 42
	i32 205, ; 43
	i32 69, ; 44
	i32 332, ; 45
	i32 220, ; 46
	i32 83, ; 47
	i32 317, ; 48
	i32 252, ; 49
	i32 200, ; 50
	i32 316, ; 51
	i32 131, ; 52
	i32 55, ; 53
	i32 149, ; 54
	i32 74, ; 55
	i32 145, ; 56
	i32 62, ; 57
	i32 146, ; 58
	i32 336, ; 59
	i32 165, ; 60
	i32 328, ; 61
	i32 235, ; 62
	i32 12, ; 63
	i32 248, ; 64
	i32 125, ; 65
	i32 206, ; 66
	i32 0, ; 67
	i32 152, ; 68
	i32 113, ; 69
	i32 166, ; 70
	i32 164, ; 71
	i32 250, ; 72
	i32 263, ; 73
	i32 84, ; 74
	i32 315, ; 75
	i32 309, ; 76
	i32 186, ; 77
	i32 150, ; 78
	i32 298, ; 79
	i32 60, ; 80
	i32 182, ; 81
	i32 51, ; 82
	i32 103, ; 83
	i32 114, ; 84
	i32 40, ; 85
	i32 289, ; 86
	i32 0, ; 87
	i32 287, ; 88
	i32 120, ; 89
	i32 194, ; 90
	i32 323, ; 91
	i32 52, ; 92
	i32 44, ; 93
	i32 119, ; 94
	i32 240, ; 95
	i32 321, ; 96
	i32 246, ; 97
	i32 81, ; 98
	i32 136, ; 99
	i32 283, ; 100
	i32 227, ; 101
	i32 8, ; 102
	i32 73, ; 103
	i32 303, ; 104
	i32 155, ; 105
	i32 300, ; 106
	i32 154, ; 107
	i32 92, ; 108
	i32 295, ; 109
	i32 45, ; 110
	i32 318, ; 111
	i32 306, ; 112
	i32 175, ; 113
	i32 299, ; 114
	i32 109, ; 115
	i32 129, ; 116
	i32 198, ; 117
	i32 25, ; 118
	i32 217, ; 119
	i32 196, ; 120
	i32 72, ; 121
	i32 55, ; 122
	i32 46, ; 123
	i32 327, ; 124
	i32 185, ; 125
	i32 241, ; 126
	i32 22, ; 127
	i32 255, ; 128
	i32 205, ; 129
	i32 86, ; 130
	i32 43, ; 131
	i32 160, ; 132
	i32 71, ; 133
	i32 269, ; 134
	i32 3, ; 135
	i32 42, ; 136
	i32 63, ; 137
	i32 16, ; 138
	i32 53, ; 139
	i32 211, ; 140
	i32 330, ; 141
	i32 294, ; 142
	i32 209, ; 143
	i32 105, ; 144
	i32 193, ; 145
	i32 299, ; 146
	i32 290, ; 147
	i32 252, ; 148
	i32 34, ; 149
	i32 158, ; 150
	i32 85, ; 151
	i32 32, ; 152
	i32 12, ; 153
	i32 51, ; 154
	i32 56, ; 155
	i32 273, ; 156
	i32 36, ; 157
	i32 215, ; 158
	i32 181, ; 159
	i32 305, ; 160
	i32 291, ; 161
	i32 225, ; 162
	i32 35, ; 163
	i32 58, ; 164
	i32 259, ; 165
	i32 174, ; 166
	i32 175, ; 167
	i32 17, ; 168
	i32 296, ; 169
	i32 164, ; 170
	i32 318, ; 171
	i32 258, ; 172
	i32 184, ; 173
	i32 286, ; 174
	i32 212, ; 175
	i32 324, ; 176
	i32 153, ; 177
	i32 282, ; 178
	i32 267, ; 179
	i32 197, ; 180
	i32 322, ; 181
	i32 227, ; 182
	i32 29, ; 183
	i32 173, ; 184
	i32 52, ; 185
	i32 320, ; 186
	i32 287, ; 187
	i32 5, ; 188
	i32 304, ; 189
	i32 292, ; 190
	i32 277, ; 191
	i32 281, ; 192
	i32 232, ; 193
	i32 300, ; 194
	i32 224, ; 195
	i32 199, ; 196
	i32 243, ; 197
	i32 85, ; 198
	i32 207, ; 199
	i32 286, ; 200
	i32 61, ; 201
	i32 112, ; 202
	i32 195, ; 203
	i32 57, ; 204
	i32 334, ; 205
	i32 273, ; 206
	i32 99, ; 207
	i32 264, ; 208
	i32 19, ; 209
	i32 236, ; 210
	i32 293, ; 211
	i32 111, ; 212
	i32 101, ; 213
	i32 102, ; 214
	i32 302, ; 215
	i32 104, ; 216
	i32 290, ; 217
	i32 176, ; 218
	i32 71, ; 219
	i32 38, ; 220
	i32 32, ; 221
	i32 103, ; 222
	i32 73, ; 223
	i32 308, ; 224
	i32 9, ; 225
	i32 123, ; 226
	i32 46, ; 227
	i32 226, ; 228
	i32 186, ; 229
	i32 9, ; 230
	i32 207, ; 231
	i32 43, ; 232
	i32 4, ; 233
	i32 274, ; 234
	i32 177, ; 235
	i32 312, ; 236
	i32 307, ; 237
	i32 31, ; 238
	i32 138, ; 239
	i32 92, ; 240
	i32 93, ; 241
	i32 327, ; 242
	i32 49, ; 243
	i32 141, ; 244
	i32 112, ; 245
	i32 140, ; 246
	i32 242, ; 247
	i32 115, ; 248
	i32 291, ; 249
	i32 157, ; 250
	i32 76, ; 251
	i32 79, ; 252
	i32 262, ; 253
	i32 37, ; 254
	i32 285, ; 255
	i32 246, ; 256
	i32 239, ; 257
	i32 64, ; 258
	i32 138, ; 259
	i32 15, ; 260
	i32 116, ; 261
	i32 279, ; 262
	i32 288, ; 263
	i32 234, ; 264
	i32 48, ; 265
	i32 70, ; 266
	i32 80, ; 267
	i32 126, ; 268
	i32 177, ; 269
	i32 94, ; 270
	i32 121, ; 271
	i32 297, ; 272
	i32 214, ; 273
	i32 26, ; 274
	i32 200, ; 275
	i32 255, ; 276
	i32 97, ; 277
	i32 28, ; 278
	i32 230, ; 279
	i32 325, ; 280
	i32 303, ; 281
	i32 149, ; 282
	i32 169, ; 283
	i32 4, ; 284
	i32 98, ; 285
	i32 33, ; 286
	i32 204, ; 287
	i32 93, ; 288
	i32 278, ; 289
	i32 182, ; 290
	i32 21, ; 291
	i32 41, ; 292
	i32 170, ; 293
	i32 319, ; 294
	i32 248, ; 295
	i32 311, ; 296
	i32 262, ; 297
	i32 296, ; 298
	i32 288, ; 299
	i32 268, ; 300
	i32 2, ; 301
	i32 134, ; 302
	i32 111, ; 303
	i32 183, ; 304
	i32 331, ; 305
	i32 217, ; 306
	i32 196, ; 307
	i32 328, ; 308
	i32 58, ; 309
	i32 95, ; 310
	i32 310, ; 311
	i32 39, ; 312
	i32 228, ; 313
	i32 25, ; 314
	i32 94, ; 315
	i32 89, ; 316
	i32 99, ; 317
	i32 10, ; 318
	i32 87, ; 319
	i32 100, ; 320
	i32 275, ; 321
	i32 178, ; 322
	i32 297, ; 323
	i32 211, ; 324
	i32 219, ; 325
	i32 307, ; 326
	i32 7, ; 327
	i32 259, ; 328
	i32 302, ; 329
	i32 216, ; 330
	i32 88, ; 331
	i32 254, ; 332
	i32 154, ; 333
	i32 306, ; 334
	i32 33, ; 335
	i32 116, ; 336
	i32 82, ; 337
	i32 201, ; 338
	i32 208, ; 339
	i32 215, ; 340
	i32 20, ; 341
	i32 11, ; 342
	i32 162, ; 343
	i32 3, ; 344
	i32 190, ; 345
	i32 314, ; 346
	i32 185, ; 347
	i32 183, ; 348
	i32 84, ; 349
	i32 301, ; 350
	i32 64, ; 351
	i32 202, ; 352
	i32 316, ; 353
	i32 282, ; 354
	i32 143, ; 355
	i32 213, ; 356
	i32 263, ; 357
	i32 157, ; 358
	i32 41, ; 359
	i32 117, ; 360
	i32 179, ; 361
	i32 218, ; 362
	i32 310, ; 363
	i32 271, ; 364
	i32 131, ; 365
	i32 75, ; 366
	i32 197, ; 367
	i32 66, ; 368
	i32 320, ; 369
	i32 172, ; 370
	i32 222, ; 371
	i32 143, ; 372
	i32 106, ; 373
	i32 151, ; 374
	i32 70, ; 375
	i32 156, ; 376
	i32 178, ; 377
	i32 121, ; 378
	i32 127, ; 379
	i32 315, ; 380
	i32 152, ; 381
	i32 245, ; 382
	i32 141, ; 383
	i32 232, ; 384
	i32 312, ; 385
	i32 20, ; 386
	i32 14, ; 387
	i32 135, ; 388
	i32 75, ; 389
	i32 59, ; 390
	i32 198, ; 391
	i32 235, ; 392
	i32 167, ; 393
	i32 168, ; 394
	i32 202, ; 395
	i32 188, ; 396
	i32 15, ; 397
	i32 74, ; 398
	i32 6, ; 399
	i32 23, ; 400
	i32 257, ; 401
	i32 203, ; 402
	i32 216, ; 403
	i32 91, ; 404
	i32 313, ; 405
	i32 1, ; 406
	i32 136, ; 407
	i32 258, ; 408
	i32 281, ; 409
	i32 134, ; 410
	i32 69, ; 411
	i32 146, ; 412
	i32 322, ; 413
	i32 301, ; 414
	i32 249, ; 415
	i32 184, ; 416
	i32 88, ; 417
	i32 96, ; 418
	i32 239, ; 419
	i32 244, ; 420
	i32 212, ; 421
	i32 317, ; 422
	i32 31, ; 423
	i32 45, ; 424
	i32 253, ; 425
	i32 218, ; 426
	i32 109, ; 427
	i32 158, ; 428
	i32 35, ; 429
	i32 22, ; 430
	i32 114, ; 431
	i32 57, ; 432
	i32 279, ; 433
	i32 210, ; 434
	i32 144, ; 435
	i32 118, ; 436
	i32 120, ; 437
	i32 110, ; 438
	i32 220, ; 439
	i32 139, ; 440
	i32 226, ; 441
	i32 54, ; 442
	i32 105, ; 443
	i32 323, ; 444
	i32 189, ; 445
	i32 190, ; 446
	i32 133, ; 447
	i32 295, ; 448
	i32 284, ; 449
	i32 272, ; 450
	i32 329, ; 451
	i32 249, ; 452
	i32 209, ; 453
	i32 192, ; 454
	i32 159, ; 455
	i32 308, ; 456
	i32 236, ; 457
	i32 163, ; 458
	i32 132, ; 459
	i32 272, ; 460
	i32 161, ; 461
	i32 321, ; 462
	i32 260, ; 463
	i32 140, ; 464
	i32 284, ; 465
	i32 280, ; 466
	i32 169, ; 467
	i32 191, ; 468
	i32 221, ; 469
	i32 289, ; 470
	i32 40, ; 471
	i32 247, ; 472
	i32 81, ; 473
	i32 56, ; 474
	i32 37, ; 475
	i32 97, ; 476
	i32 166, ; 477
	i32 172, ; 478
	i32 285, ; 479
	i32 82, ; 480
	i32 223, ; 481
	i32 98, ; 482
	i32 30, ; 483
	i32 159, ; 484
	i32 18, ; 485
	i32 292, ; 486
	i32 127, ; 487
	i32 119, ; 488
	i32 243, ; 489
	i32 275, ; 490
	i32 256, ; 491
	i32 277, ; 492
	i32 165, ; 493
	i32 251, ; 494
	i32 203, ; 495
	i32 336, ; 496
	i32 274, ; 497
	i32 265, ; 498
	i32 170, ; 499
	i32 16, ; 500
	i32 144, ; 501
	i32 314, ; 502
	i32 125, ; 503
	i32 118, ; 504
	i32 38, ; 505
	i32 115, ; 506
	i32 47, ; 507
	i32 142, ; 508
	i32 117, ; 509
	i32 210, ; 510
	i32 34, ; 511
	i32 174, ; 512
	i32 95, ; 513
	i32 53, ; 514
	i32 266, ; 515
	i32 208, ; 516
	i32 129, ; 517
	i32 153, ; 518
	i32 24, ; 519
	i32 161, ; 520
	i32 242, ; 521
	i32 148, ; 522
	i32 104, ; 523
	i32 89, ; 524
	i32 194, ; 525
	i32 230, ; 526
	i32 60, ; 527
	i32 142, ; 528
	i32 100, ; 529
	i32 5, ; 530
	i32 13, ; 531
	i32 122, ; 532
	i32 135, ; 533
	i32 28, ; 534
	i32 309, ; 535
	i32 72, ; 536
	i32 240, ; 537
	i32 24, ; 538
	i32 206, ; 539
	i32 228, ; 540
	i32 270, ; 541
	i32 267, ; 542
	i32 326, ; 543
	i32 137, ; 544
	i32 199, ; 545
	i32 221, ; 546
	i32 237, ; 547
	i32 168, ; 548
	i32 271, ; 549
	i32 305, ; 550
	i32 101, ; 551
	i32 214, ; 552
	i32 123, ; 553
	i32 241, ; 554
	i32 180, ; 555
	i32 163, ; 556
	i32 167, ; 557
	i32 244, ; 558
	i32 39, ; 559
	i32 187, ; 560
	i32 313, ; 561
	i32 17, ; 562
	i32 171, ; 563
	i32 326, ; 564
	i32 325, ; 565
	i32 137, ; 566
	i32 150, ; 567
	i32 233, ; 568
	i32 155, ; 569
	i32 130, ; 570
	i32 19, ; 571
	i32 65, ; 572
	i32 147, ; 573
	i32 47, ; 574
	i32 333, ; 575
	i32 219, ; 576
	i32 79, ; 577
	i32 61, ; 578
	i32 106, ; 579
	i32 269, ; 580
	i32 223, ; 581
	i32 49, ; 582
	i32 254, ; 583
	i32 330, ; 584
	i32 266, ; 585
	i32 14, ; 586
	i32 179, ; 587
	i32 68, ; 588
	i32 195, ; 589
	i32 171, ; 590
	i32 229, ; 591
	i32 233, ; 592
	i32 335, ; 593
	i32 78, ; 594
	i32 238, ; 595
	i32 108, ; 596
	i32 222, ; 597
	i32 265, ; 598
	i32 67, ; 599
	i32 63, ; 600
	i32 27, ; 601
	i32 160, ; 602
	i32 201, ; 603
	i32 231, ; 604
	i32 10, ; 605
	i32 187, ; 606
	i32 11, ; 607
	i32 78, ; 608
	i32 264, ; 609
	i32 126, ; 610
	i32 83, ; 611
	i32 181, ; 612
	i32 66, ; 613
	i32 107, ; 614
	i32 65, ; 615
	i32 128, ; 616
	i32 122, ; 617
	i32 77, ; 618
	i32 280, ; 619
	i32 270, ; 620
	i32 334, ; 621
	i32 8, ; 622
	i32 237, ; 623
	i32 2, ; 624
	i32 44, ; 625
	i32 283, ; 626
	i32 156, ; 627
	i32 128, ; 628
	i32 268, ; 629
	i32 23, ; 630
	i32 133, ; 631
	i32 225, ; 632
	i32 256, ; 633
	i32 329, ; 634
	i32 311, ; 635
	i32 29, ; 636
	i32 224, ; 637
	i32 62, ; 638
	i32 176, ; 639
	i32 189, ; 640
	i32 90, ; 641
	i32 87, ; 642
	i32 148, ; 643
	i32 191, ; 644
	i32 36, ; 645
	i32 86, ; 646
	i32 245, ; 647
	i32 324, ; 648
	i32 319, ; 649
	i32 180, ; 650
	i32 50, ; 651
	i32 6, ; 652
	i32 90, ; 653
	i32 331, ; 654
	i32 21, ; 655
	i32 162, ; 656
	i32 96, ; 657
	i32 50, ; 658
	i32 213, ; 659
	i32 113, ; 660
	i32 261, ; 661
	i32 130, ; 662
	i32 204, ; 663
	i32 76, ; 664
	i32 27, ; 665
	i32 238, ; 666
	i32 260, ; 667
	i32 7, ; 668
	i32 188, ; 669
	i32 173, ; 670
	i32 110, ; 671
	i32 261, ; 672
	i32 247 ; 673
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}

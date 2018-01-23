class CfgFunctions
{
	class grad_telephone {

		class calling
		{
			file = "\grad_telephone\functions\calling";

			class callAccept;
			class callDialing;
			class callEnding;
			class callReceiving;
			class callReject;
			class callTalking;
			class callWaiting;
			class callWaitingDroppedPhone;

			class pleaseReceive;
			class setCallersPhoneFrequency;
		};

		class celltower
		{
			file = "\grad_telephone\functions\celltower";

			class cellTowerCalculateTFARMultiplicator;
			class cellTowerGetAttendeesDistance;
			class cellTowerMarkerCreate;
			class cellTowerRefreshSignalStrength;
			class cellTowerSignalStrengthCheck;
			class cellTowerSpawn;
			class isCellTowerReachable;
		};

		class core
		{
			file = "\grad_telephone\functions\core";

			class generatePhoneNumber;
			class getNativePhoneCode;
			class getNativePhoneFrequency;
			class getRadio;
			class getUniquePhoneNumber;

			class initAll { postInit = 1; };
			class initClient;
			class initServer;

			class isCellphone;
			class setNativePhoneFrequency;

		};

		class ied {
			file = "\grad_telephone\functions\ied";

			class callIED;
			class destroyIED;
			class isSelectedContactIED;
			class programIED;
		}

		class interaction {
			file = "\grad_telephone\functions\interaction";

			class interactGiveNumber;
			class interactHasNumber;
			class interactReceiveNumber;
			class playGiveAnimation;
		}

		class ui {
			file = "\grad_telephone\functions\ui";

			class getPhoneContactList;
			class getSelectedContactName;
			class getSelectedContactObject;
			class getSelectedContactRadioID;
			class isNotInContacts;
			class restoreDisplay;
			class setDisplayName;
			class setDisplayNumber;
			class setPhoneContactList;
			class showHint;
			class showHintCall;
			class showHintUnlimited;
			class showNextContact;
			class showNextMenuEntry;
			class showRadioInfo;
			class updateContactList;

		}


	};
};

class CfgFunctions
{
	class GRAD
	{
		class Radio
		{
			file="grad_telephone\functions";

			class buttonPressed;

			class callAccept;
			class callDialing;
			class callEnding;
			class callIED;
			class callReject;
			class callReceiving;
			class callTalking;
			class callWaiting;
			class callWaitingDroppedPhone;

			class cellTowerCalculateTFARMultiplicator;
			class cellTowerGetAttendeesDistance;
			class cellTowerMarkerCreate;
			class cellTowerRefreshSignalStrength;
			class cellTowerSignalStrengthCheck;
			class cellTowerSpawn;

			class destroyIED;

			class fillDummyContacts;

			class generatePhoneNumber;
			class getRadio;
			class getNativePhoneCode;
			class getNativePhoneFrequency;
			class getSelectedContactName;
			class getSelectedContactObject;
			class getSelectedContactRadioID;
			class getUniquePhoneNumber;
			class gotoHomescreen;

			class interactGiveNumber;
			class interactHasNumber;
			class interactReceiveNumber;
			class initAll{postInit = 1;};
			class initClient;
			class initServer;
			class isNotInContacts;
			class isCellphone;
			class isCellTowerReachable;
			class isSelectedContactIED;

			class playGiveAnimation;
			class pleaseReceive;
			class programIED;

			class restoreDisplay;		

			class setCallersPhoneFrequency;
			class setNativePhoneFrequency;
			class setDisplayName;
			class setDisplayNumber;

			class showHint;
			class showHintUnlimited;
			class showNextContact;
			class showRadioInfo;

			class updateContactList;
		};
	};
};
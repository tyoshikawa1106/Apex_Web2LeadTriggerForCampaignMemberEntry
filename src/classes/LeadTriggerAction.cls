/**
 * Lead Trigger
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdDate      : 2013/01/01
 * @createdName      : Taiki,Yoshikawa
 * ----------------------------------------
 * @lastModifiedDate : 2013/01/01
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class LeadTriggerAction {
	
	/**
     * コンストラクタ
     */
    public LeadTriggerAction() {
        
    }
    
    /**
     * キャンペーンメンバーの情報取得
     * @param   : リード   [l]
     * @return  : キャンペーンメンバー
     */
    public CampaignMember getCampaignMember(Lead l) {
    	return new CampaignMember(
             CampaignId = l.CampaignCd__c
            ,LeadId = l.Id
        );
    }
}
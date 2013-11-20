/**
 * CampaignMember Trigger
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdDate      : 2013/01/01
 * @createdName      : Taiki,Yoshikawa
 * ----------------------------------------
 * @lastModifiedDate : 2013/01/01
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class CampaignMemberTriggerAction {
	
	/**
     * コンストラクタ
     */
	public CampaignMemberTriggerAction() {
		
	}
	
	/**
     * 追加登録するリード1の情報取得
     * @param   : キャンペーンメンバー   [c]
     * @return  : リード情報
     */
	public Lead getAddLead1(CampaignMember c) {
		return new Lead(
    		 LastName = c.Lead.Add_LastName1__c
    		,FirstName = c.Lead.Add_FirstName1__c
    		,CampaignCd__c = c.CampaignId
    		,Company = c.Lead.Company
    		,LeadSource = c.Lead.LeadSource
    	);
	}
	
	/**
     * 追加登録するリード2の情報取得
     * @param   : キャンペーンメンバー   [c]
     * @return  : リード情報
     */
	public Lead getAddLead2(CampaignMember c) {
		return new Lead(
    		 LastName = c.Lead.Add_LastName2__c
    		,FirstName = c.Lead.Add_FirstName2__c
    		,CampaignCd__c = c.CampaignId
    		,Company = c.Lead.Company
    		,LeadSource = c.Lead.LeadSource
    	);
	}
}
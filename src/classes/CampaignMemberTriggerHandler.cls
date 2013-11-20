/**
 * CampaignMember Trigger
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class CampaignMemberTriggerHandler {
	
	private CampaignMemberTriggerDao dao = new CampaignMemberTriggerDao();
	private CampaignMemberTriggerAction action = new CampaignMemberTriggerAction();
	private static Boolean IS_LOOP;
	
	/**
     * コンストラクタ
     */
    public CampaignMemberTriggerHandler() {
        IS_LOOP = false;
    }
    
    /**
     * Web2Leadによるキャンペーンに紐付くリードの一括登録
     * @param   : キャンペーンメンバー   [prmCampaignMemberNews]
     * @return  : none
     */
    public void doInsertMultipleLeads(List<CampaignMember> prmCampaignMemberNews) {
        System.debug('doInsertMultipleLeads:START');
        
        if (IS_LOOP) return;
        
        List<CampaignMember> campaignMembers = this.dao.getCampaignMembers(prmCampaignMemberNews);
        
        List<Lead> leads = new List<Lead>();
        for (CampaignMember c : campaignMembers) {
        	
        	// 追加登録リード1
        	if (String.isNotEmpty(c.Lead.Add_LastName1__c)) {
        		
	        	leads.add(this.action.getAddLead1(c));
        	}
        	
        	// 追加登録リード2
        	if (String.isNotEmpty(c.Lead.Add_LastName2__c)) {
	        	
	        	leads.add(this.action.getAddLead2(c));
        	}
        }
        
        if (!leads.isEmpty()) {
        	insert leads;
        }
        
        IS_LOOP = true;
        
        System.debug('doInsertMultipleLeads:END');
    }
}
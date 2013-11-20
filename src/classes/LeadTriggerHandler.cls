/**
 * Lead Trigger
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class LeadTriggerHandler {
    
    private LeadTriggerAction action = new LeadTriggerAction();
    
    /**
     * コンストラクタ
     */
    public LeadTriggerHandler() {
        
    }
    
    /**
     * Web2Leadによるリードの一括登録
     * @param   : リード   [prmLeadNews]
     * @return  : none
     */
    public void doInsertMultipleLeads(List<Lead> prmLeadNews) {
        System.debug('doInsertMultipleLeads:START');
        
        List<CampaignMember> campaignMembers = new List<CampaignMember>();
        
        for (Lead l : prmLeadNews) {
            if (String.isNotEmpty(l.CampaignCd__c)) {
                // キャンペーンメンバーの情報取得
                campaignMembers.add(this.action.getCampaignMember(l));
            }
        }
        
        if (!campaignMembers.isEmpty()) {
            insert campaignMembers;
        }
        
        System.debug('doInsertMultipleLeads:END');
    }
}
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
trigger CampaignMemberTrigger on CampaignMember (after insert) {
	System.debug('CampaignMemberTrigger:START');
    
    // Handlerクラス
    CampaignMemberTriggerHandler handler = new CampaignMemberTriggerHandler();
    
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            // Web2Leadによるリードの一括登録
            handler.doInsertMultipleLeads(Trigger.new);
        }
    }
    
    System.debug('CampaignMemberTrigger:END');
}
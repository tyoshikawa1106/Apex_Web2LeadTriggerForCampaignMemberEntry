/**
 * CampaignMember Trigger
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
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
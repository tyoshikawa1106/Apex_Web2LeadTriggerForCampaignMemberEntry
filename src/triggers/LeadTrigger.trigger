/**
 * Lead Trigger
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
trigger LeadTrigger on Lead (after insert) {
    System.debug('LeadTrigger:START');
    
    // Handlerクラス
    LeadTriggerHandler handler = new LeadTriggerHandler();
    
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            // Web2Leadによるリードの一括登録
            handler.doInsertMultipleLeads(Trigger.new);
        }
    }
    
    System.debug('LeadTrigger:END');
}
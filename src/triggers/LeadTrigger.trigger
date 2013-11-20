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
/**
 * CampaignMember Trigger
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class CampaignMemberTriggerDao {
    
    /**
     * コンストラクタ
     */
    public CampaignMemberTriggerDao() {
        
    }
    
    /**
     * キャンペーンメンバーのリード情報取得
     * @param   : キャンペーンメンバー   [prmCampaignMemberNews]
     * @return  : キャンペーンメンバーのリード情報
     */
    public List<CampaignMember> getCampaignMembers(List<CampaignMember> prmCampaignMembers) {
        return [
            SELECT
                 Id
                ,CampaignId
                ,Lead.Add_LastName1__c
                ,Lead.Add_FirstName1__c
                ,Lead.Add_LastName2__c
                ,Lead.Add_FirstName2__c
                ,Lead.Company
                ,Lead.LeadSource
            FROM
                CampaignMember
            WHERE
                Id IN: prmCampaignMembers
        ];
    }
}
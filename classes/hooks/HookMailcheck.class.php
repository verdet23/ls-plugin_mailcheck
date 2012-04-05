<?php

class PluginMailcheck_HookMailcheck extends Hook
{

    public function RegisterHook()
    {
        $this->AddHook('template_form_registration_begin', 'AddMailCheck', __CLASS__);
    }

    public function AddMailCheck()
    {
        $aDomains = Config::Get('plugin.mailcheck.domains');
        $this->Viewer_Assign('aDomains', $aDomains);
        $this->Viewer_Assign('sTemplateWebPathPluginMailcheck', Plugin::GetTemplateWebPath(__CLASS__));
        return $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__) . 'mailcheck.tpl');
    }

}
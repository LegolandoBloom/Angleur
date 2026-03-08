
AngleurPorted_ActionBarButtonSpellActivationAlertMixin = {};
function AngleurPorted_ActionBarButtonSpellActivationAlertMixin:OnHide()
	if ( self.ProcLoop:IsPlaying() ) then
		self.ProcLoop:Stop();
	end
end

AngleurPorted_ActionBarButtonSpellActivationAlertProcStartAnimMixin = { }; 
function AngleurPorted_ActionBarButtonSpellActivationAlertProcStartAnimMixin:OnFinished()
	self:GetParent().ProcLoop:Play();
end
<form action={concat($module.functions.edit.uri,"/",$workflow.id)|ezurl} method="post" name="WorkflowEdit">

<div class="maincontentheader">
<h1>{"Editing workflow"|i18n("design/standard/workflow")} - {$workflow.name}</h1>
</div>

{section show=$can_store}
<div class="feedback">
<h2>{"Workflow stored"|i18n("design/standard/workflow")}</h2>
</div>
{/section}
{section show=$require_fixup}
<div class="warning">
<h2>{"Data requires fixup"|i18n("design/standard/workflow")}</h2>
</div>
{/section}

<div class="byline">
<p class="modified">{"Modified by"|i18n("design/standard/workflow")} {content_view_gui view=text_linked content_object=$workflow.creator.contentobject} {"on"|i18n("design/standard/workflow")} {$workflow.modified|l10n(shortdatetime)}</p>
</div>

<div class="block">
<label>{"Name"|i18n("design/standard/workflow")}</label><div class="labelbreak"></div>
{include uri="design:gui/lineedit.tpl" name=Name id_name=Workflow_name value=$workflow.name}
</div>

<h2>{"Groups"|i18n("design/standard/workflow")}</h2>
<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
{section name=InGroups loop=$workflow.ingroup_list sequence=array(bglight,bgdark)}
<tr>
    <td class="{$InGroups:sequence}" width="99%">{$InGroups:item.group_name}</td>
    <td class="{$InGroups:sequence}" width="1%"><input type="checkbox" name="group_id_checked[]" value="{$InGroups:item.group_id}"></td>
</tr>
{/section}
<tr>
    <td></td>
    <td>
    {include uri="design:gui/button.tpl" name=DeleteGroup id_name=DeleteGroupButton value='Remove'|i18n('design/standard/workflow')}
    </td>
</tr>
</table>

<div class="buttonblock">
<select name="Workflow_group">
{section name=AllGroup loop=$workflow.group_list}
<option name="Workflow_group[]" value="{$AllGroup:item.id}/{$AllGroup:item.name}">{$AllGroup:item.name}</option>
{/section}
</select>
&nbsp;{include uri="design:gui/button.tpl" name=AddGroup id_name=AddGroupButton value="Add group"|i18n('design/standard/workflow')}
</div>

<h2>{"Events"|i18n("design/standard/workflow")}</h2>

<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <th width="1%">{"Pos"|i18n("design/standard/workflow")}</th>
    <th>{"Description"|i18n("design/standard/workflow")}</th>
    <th>{"Type"|i18n("design/standard/workflow")}</th>
    <th width="1%" colspan="3">&nbsp;</th>
</tr>
{section name=Event loop=$event_list sequence=array(bglight,bgdark)}
<input type="hidden" name="WorkflowEvent_id[]" value="{$Event:item.id}" />
<input type="hidden" name="WorkflowEvent_placement[]" value="{$Event:item.placement}" />
<tr>
    <td class="{$Event:sequence}">{$Event:number}({$Event:item.placement})</td>
    <td class="{$Event:sequence}">{include uri="design:gui/lineedit.tpl" name=EventDescription id_name="WorkflowEvent_description[]" value=$Event:item.description}</td>
    <td class="{$Event:sequence}">{$Event:item.workflow_type.group_name}/{$Event:item.workflow_type.name}</td>
    <td class="{$Event:sequence}"><div class="listbutton"><a href={concat($module.functions.down.uri,"/",$workflow.id,"/",$Event:item.id)|ezurl}><img src={"button-move_down.gif"|ezimage} height="16" width="16" alt="Move down" /></a></div></td>
    <td class="{$Event:sequence}"><div class="listbutton"><a href={concat($module.functions.up.uri,"/",$workflow.id,"/",$Event:item.id)|ezurl}><img src={"button-move_up.gif"|ezimage} height="16" width="16" alt="Move up" /></a></div></td>
    <td class="{$Event:sequence}"><input type="checkbox" name="WorkflowEvent_id_checked[]" value="{$Event:item.id}" /></td>
</tr>
<tr>
    <td class="{$Event:sequence}extra">&nbsp;</td>
    <td class="{$Event:sequence}extra" colspan="5">{event_edit_gui event=$Event:item}</td>
</tr>
{/section}
</table>


<div class="buttonblock">
{include uri="design:gui/button.tpl" name=New id_name=NewButton value="New"|i18n("design/standard/workflow")}{include uri="design:workflow/workflowtypes.tpl" name=WorkflowTypes id_name=WorkflowTypeString workflowtypes=$workflow_type_list current=$workflow_type}
&nbsp;
{include uri="design:gui/button.tpl" name=Delete id_name=DeleteButton value="Remove"|i18n("design/standard/workflow")}
</div>

<div class="buttonblock">
{include uri="design:gui/button.tpl" name=Store id_name=StoreButton value="Store"|i18n("design/standard/workflow")}
{* {include uri="design:gui/button.tpl" name=Apply id_name=ApplyButton value=Apply} *}
{include uri="design:gui/button.tpl" name=Discard id_name=DiscardButton value="Discard"|i18n("design/standard/workflow")}
</div>

</form>

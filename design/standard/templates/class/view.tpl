<div class="maincontentheader">
    <h1>{"Class - %1"|i18n("design/standard/class/edit",,array( $class.name|wash) )}</h1>
</div>

<a href={concat( "class/edit/", $class.id )|ezurl}><img class="button" src={"edit.png"|ezimage} width="16" height="16" alt="{'Edit'|i18n('design/standard/class/view')}" /></a>

<div class="byline">
<p class="date">{"Last modified by %username on %time"|i18n("design/standard/class/edit",,
                                                            hash('%username',$class.modifier.contentobject.name,
                                                                 '%time',$class.modified|l10n(shortdatetime)))}</p>
</div>

<table class="layout" width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
  <td valign="top">

<div class="block">
    <label>{"Name"|i18n("design/standard/class/edit")}</label><div class="labelbreak"></div>
    <p>{$class.name|wash}</p>
</div>

<div class="block">
    <label>{"Identifier"|i18n("design/standard/class/edit")}</label><div class="labelbreak"></div>
    <p>{$class.identifier|wash}</p>
</div>

<div class="block">
    <label>{"Object name pattern"|i18n("design/standard/class/edit")}</label><div class="labelbreak"></div>
    <p>{$class.contentobject_name|wash}</p>
</div>

  </td>

  <td valign="top">

<table class="list" width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
    <th colspan="1">{"Member of groups"|i18n("design/standard/class/edit")}</th>
</tr>
{section name=InGroups loop=$class.ingroup_list sequence=array(bglight,bgdark)}
<tr>
    <td class="{$InGroups:sequence}" width="99%"><a href={concat( "/class/classlist/", $InGroups:item.group_id )|ezurl}>{$InGroups:item.group_name|wash}</a></td>
</tr>
{/section}
</table>

  </td>
</tr>

</table>


<h2>{"Attributes"|i18n("design/standard/class/edit")}</h2>
<table class="class_list" width="100%" cellpadding="0" cellspacing="0" border="0">

{section name=Attributes loop=$attributes sequence=array("bglight","bgdark")}

<tr>
    <td colspan="3"><b>{$:number}. {$:item.name|wash} ({$:item.data_type.information.name|wash}) (id:{$:item.id}) </b></td>
</tr>

<tr>

    <td class="{$Attributes:sequence}">
        <input type="hidden" name="ContentAttribute_id[]" value="{$Attributes:item.id}" />
        <input type="hidden" name="ContentAttribute_position[]" value="{$Attributes:item.placement}" />

        <div class="block">
            <label>{"Name"|i18n("design/standard/class/edit")}</label><div class="labelbreak"></div>
            <p>{$Attributes:item.name|wash}</p>
        </div>
    </td>

    <td class="{$Attributes:sequence}">
        <div class="block">
            <label>{"Identifier"|i18n("design/standard/class/edit")}</label><div class="labelbreak"></div>
            <p>{$Attributes:item.identifier|wash}</p>
        </div>
    </td>



    <td class="{$Attributes:sequence}" rowspan="2" width="20%" valign="top">

        <div class="block">
            <p>{section show=$Attributes:item.is_required}{"Is required"|i18n("design/standard/class/edit")}{section-else}{"Is not required"|i18n("design/standard/class/edit")}{/section}</p>
        </div>

        {section show=$Attributes:item.data_type.is_indexable}
        <div class="block">
            <p>{section show=$Attributes:item.is_searchable}{"Is searchable"|i18n("design/standard/class/edit")}{section-else}{"Is not searchable"|i18n("design/standard/class/edit")}{/section}</p>
        </div>
        {section-else}
        <div class="block">
            <p>{"Is not searchable"|i18n("design/standard/class/edit")}</p>
        </div>
        {/section}

        {section show=$Attributes:item.data_type.is_information_collector}
        <div class="block">
            <p>{section show=$Attributes:item.is_information_collector}{"Collects information"|i18n("design/standard/class/edit")}{section-else}{"Does not collect information"|i18n("design/standard/class/edit")}{/section}</p>
        </div> 
        {section-else}
        <div class="block">
            <p>{"Does not collect information"|i18n("design/standard/class/edit")}</p>
        </div>
        {/section}

        <div class="block">
            <p>{section show=$Attributes:item.can_translate|eq(0)}{"Translation is disabled"|i18n("design/standard/class/edit")}{section-else}{"Translation is enabled"|i18n("design/standard/class/edit")}{/section}</p>
        </div>

    </td>

</tr>

<tr>
    <td class="{$Attributes:sequence}" colspan="2">
        {class_attribute_view_gui class_attribute=$Attributes:item}
    </td>
</tr>
{/section}

</table>

<h2>{"Override templates"|i18n("design/standard/class/edit")}</h2>
<table class="list" cellspacing="0" cellpadding="0" width="100%">
<tr><th>{"SiteAccess"|i18n("design/standard/class/edit")}</th><th>{"Override"|i18n("design/standard/class/edit")}</th><th>{"Source template"|i18n("design/standard/class/edit")}</th><th>{"Override template"|i18n("design/standard/class/edit")}</th><th>{"Edit"|i18n("design/standard/class/edit")}</th></tr>
{let test=fetch( class, override_template_list, hash( class_id, $class.id ) )}

{section loop=$test}
<tr><td>{$:item.siteaccess}</td><td>{$:item.block}</td><td><a href={concat( "/setup/templateview/", $:item.source )|ezurl}>{$:item.source}</td><td>{$:item.target}</td><td><a href={concat("/setup/templateedit/",$:item.target)|ezurl}><img src={"edit.png"|ezimage} alt="Edit" /></a></td></tr>
{/section}

{/let}
</table>


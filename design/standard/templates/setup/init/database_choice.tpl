{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{*?template charset=latin1?*}

<div align="center">
  <h1>{"Choose database system"|i18n("design/standard/setup/init")}</h1>
</div>

<p>
 {"Both MySQL and PostgreSQL support was detected on your system. Please choose the database system you would like to use."|i18n("design/standard/setup/init")}
</p>

<form method="post" action="{$script}">
<div class="input_highlight">
<table border="0" cellspacing="0" cellpadding="0">
<tr>
  <th class="normal" colspan="3">Database:</th>
</tr>
{section name=DB loop=$database_list}
<tr>
  <td class="normal">{$:item.name}</td>
  <td rowspan="1" class="normal">&nbsp;&nbsp;</td>
  <td class="normal" rowspan="1" valign="top">
  <input type="radio" name="eZSetupDatabaseType" value="{$:item.type}" {section show=eq( $:item.type, $database_info.type )}checked="checked" {/section}/>
  </td>
</tr>
{/section}
</table>
</div>

  {include uri='design:setup/init/navigation.tpl'}
  {include uri='design:setup/persistence.tpl'}
</form>

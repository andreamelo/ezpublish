{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{*?template charset=latin1?*}

<form method="post" action="{$script}">

  <div align="center">
    <h1>{"Site access configuration"|i18n("design/standard/setup/init")}</h1>
  </div>

  <p>
    {"Please choose the access method you wish to use for your site. The access method determines how the site will be accessed from within a web browser. If unsure: choose URL."|i18n("design/standard/setup/init")|break}
  </p>

  <p>
  <div class="input_highlight">
    <table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="normal">
          <input type="radio" name="eZSetup_site_access" value="url" {section show=$site_types[0].access_type|eq( 'url' )}checked="checked"{/section} >{"URL (recommended)"|i18n("design/standard/setup/init")}</input>
        </td>
      </tr>
      <tr>
        <td class="normal">
{*          <input type="radio" name="eZSetup_site_access" value="port">{"Port. Note: Requires web server configuration "|i18n("design/standard/setup/init")}</input>*}
          <input type="radio" name="eZSetup_site_access" value="port" {section show=$site_types[0].access_type|eq( 'port' )}checked="checked"{/section} >{"Port"|i18n("design/standard/setup/init")}</input>
        </td>
      </tr>
      <tr>
        <td class="normal">
{*          <input type="radio" name="eZSetup_site_access" value="hostname">{"Hostname. Note: Requires DNS setup."|i18n("design/standard/setup/init")}</input>*}
          <input type="radio" name="eZSetup_site_access" value="hostname" {section show=$site_types[0].access_type|eq( 'hostname' )}checked="checked"{/section} >{"Hostname"|i18n("design/standard/setup/init")}</input>
        </td>
      </tr>
    </table>
  </div>
  </p>

  {include uri='design:setup/init/navigation.tpl'}
  {include uri="design:setup/persistence.tpl"}

</form>

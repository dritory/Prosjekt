<?xml version="1.0" encoding="utf-8"?>
<SourceFile Checksum="18F6705B5B5D0B63879159359067005374E6DC9A5A6634A9B119BA7E1DCC5BCD127B377855B51AFBBC4A5F1614F6DB142250536469C5B5672E9A28DD33CE5F3B" Timestamp="1D72EC08702AC90" xmlns="http://www.ni.com/PlatformFramework">
	<SourceModelFeatureSet>
		<ParsableNamespace AssemblyFileVersion="6.2.1.50272" FeatureSetName="Interface for MATLAB®" Name="http://www.ni.com/Matlab" OldestCompatibleVersion="5.3.1.49152" Version="5.3.1.49152" />
		<ParsableNamespace AssemblyFileVersion="6.2.1.50272" FeatureSetName="Editor" Name="http://www.ni.com/PlatformFramework" OldestCompatibleVersion="6.2.0.49154" Version="6.2.0.49154" />
		<ApplicationVersionInfo Build="6.2.1.50272" Name="LabVIEW NXG" Version="3.0.0" />
	</SourceModelFeatureSet>
	<MatlabDefinition Id="1" xmlns="http://www.ni.com/Matlab">
		<p.PlatformAgnosticPathToLibrary>
			<Path a="1">
				<pE>Z</pE>
				<pE>TTT4145 - Radiokommunikasjon</pE>
				<pE>Prosjekt</pE>
				<pE>Matlab</pE>
				<pE>sink.m</pE>
			</Path>
		</p.PlatformAgnosticPathToLibrary>
		<Icon Id="2" ListViewIconCrop="0 0 40 40" xmlns="http://www.ni.com/PlatformFramework">
			<IconPanel Height="[float]40" Id="3" Left="[float]0" MinHeight="[float]0" MinWidth="[float]0" PanelSizeMode="Resize" Top="[float]0" Width="[float]40">
				<IconTemplate ClipMargin="[SMThickness]3,3,3,3" Height="[float]40" Id="4" Left="[float]0" TemplateName="[string]Gray" Top="[float]0" Width="[float]40">
					<Rectangle Fill="[SMSolidColorBrush]#ff727272" Id="5" IsHitTestVisible="[bool]False" Left="[float]0" MinHeight="[float]1" MinWidth="[float]1" RadiusX="[float]4" RadiusY="[float]4" Top="[float]0" />
					<Rectangle Fill="[SMSolidColorBrush]#ffe5e5e5" Id="6" IsHitTestVisible="[bool]False" Left="[float]0" Margin="[SMThickness]1,1,1,1" MinHeight="[float]1" MinWidth="[float]1" RadiusX="[float]2.5" RadiusY="[float]2.5" Stroke="[SMSolidColorBrush]#fff2f2f2" Top="[float]0" />
					<FileNameText Attached="[bool]True" Height="[float]36" Id="7" Left="[float]0" Margin="[SMThickness]2,2,2,2" SizeMode="[TextModelSizeMode]AutoFont" Text="[string]sink" TextAlignment="[TextAlignment]Center" TextWrapping="[TextWrapping]Wrap" Top="[float]0" VerticalScrollBarVisibility="[ScrollBarVisibility]Hidden" Width="[float]36">
						<FontSetting FontFamily="Verdana" FontSize="11.25" Id="8" />
					</FileNameText>
				</IconTemplate>
			</IconPanel>
		</Icon>
	</MatlabDefinition>
	<EnvoyManagerFile Id="9" xmlns="http://www.ni.com/PlatformFramework">
		<ProjectSettings Id="10" ModelDefinitionType="ProjectSettings" Name="ZProjectSettings" />
		<NameScopingEnvoy AutomaticallyResolveUp="True" Id="11" Name="sink.mli" NameTracksFileName="True">
			<EmbeddedDefinitionReference Id="12" ModelDefinitionType="{http://www.ni.com/Matlab}MatlabEntryPoint" Name="sink matlab">
				<MatlabEntryPoint Id="13" xmlns="http://www.ni.com/Matlab">
					<Icon Id="14" ListViewIconCrop="0 0 40 40" xmlns="http://www.ni.com/PlatformFramework">
						<IconPanel Height="[float]40" Id="15" Left="[float]0" MinHeight="[float]0" MinWidth="[float]0" PanelSizeMode="Resize" Top="[float]0" Width="[float]40">
							<IconTemplate ClipMargin="[SMThickness]3,3,3,3" Height="[float]40" Id="16" Left="[float]0" TemplateName="[string]Gray" Top="[float]0" Width="[float]40">
								<Rectangle Fill="[SMSolidColorBrush]#ff727272" Id="17" IsHitTestVisible="[bool]False" Left="[float]0" MinHeight="[float]1" MinWidth="[float]1" RadiusX="[float]4" RadiusY="[float]4" Top="[float]0" />
								<Rectangle Fill="[SMSolidColorBrush]#ffe5e5e5" Id="18" IsHitTestVisible="[bool]False" Left="[float]0" Margin="[SMThickness]1,1,1,1" MinHeight="[float]1" MinWidth="[float]1" RadiusX="[float]2.5" RadiusY="[float]2.5" Stroke="[SMSolidColorBrush]#fff2f2f2" Top="[float]0" />
								<FileNameText Attached="[bool]True" Height="[float]36" Id="19" Left="[float]0" Margin="[SMThickness]2,2,2,2" SizeMode="[TextModelSizeMode]AutoFont" Text="[string]sink matlab" TextAlignment="[TextAlignment]Center" TextWrapping="[TextWrapping]Wrap" Top="[float]0" VerticalScrollBarVisibility="[ScrollBarVisibility]Hidden" Width="[float]36">
									<FontSetting FontFamily="Verdana" FontSize="7.5" Id="20" />
								</FileNameText>
							</IconTemplate>
						</IconPanel>
					</Icon>
					<ConnectorPane Height="40" Id="21" ListViewHeight="85" ListViewWidth="150" Width="40" xmlns="http://www.ni.com/PlatformFramework">
						<ConnectorPaneTerminal ListViewHotspot="0 65" Parameter="25" />
						<ConnectorPaneTerminal Hotspot="0 15" />
						<ConnectorPaneTerminal Hotspot="0 25" />
						<ConnectorPaneTerminal Hotspot="0 35" ListViewHotspot="0 35" Parameter="22" />
						<ConnectorPaneTerminal Hotspot="15 0" />
						<ConnectorPaneTerminal Hotspot="25 0" />
						<ConnectorPaneTerminal Hotspot="40 5" />
						<ConnectorPaneTerminal Hotspot="40 15" />
						<ConnectorPaneTerminal Hotspot="40 25" />
						<ConnectorPaneTerminal Hotspot="40 35" ListViewHotspot="150 50" Parameter="23" />
						<ConnectorPaneTerminal Hotspot="15 40" />
						<ConnectorPaneTerminal Hotspot="25 40" />
					</ConnectorPane>
					<MatlabErrorDiagramParameter CallDirection="Input" Id="22" Name="error in" />
					<MatlabErrorDiagramParameter CallDirection="Output" Id="23" Name="error out" />
					<MatlabParameter DataType="UInt8[]" Id="24" Name="data">
						<MatlabDiagramParameter CallDirection="Input" Id="25" Name="data" />
						<MatlabDiagramParameter CallDirection="Output" Id="26" Name="data out" Visible="False" />
					</MatlabParameter>
				</MatlabEntryPoint>
			</EmbeddedDefinitionReference>
		</NameScopingEnvoy>
	</EnvoyManagerFile>
</SourceFile>
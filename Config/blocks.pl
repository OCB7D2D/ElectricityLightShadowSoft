use strict;
use warnings;

my @lights = (

	['porchLight01', 'soft'],
	['porchLight04', 'soft'],
	['porchLight04Brass', 'soft'],
	['ceilingLight01', 'soft'],
	['ceilingLight02', 'soft'],
	['ceilingLight02Brass', 'soft'],
	['ceilingLight04', 'soft'],
	['ceilingLight05', 'soft'],
	['ceilingLight05Brass', 'soft'],
	['recessedLight', 'soft'],
	['wallLight01', 'soft'],
	['ceilingLight07', 'soft'],
	['fluorescentLight', 'soft'],
	['trackLight', 'soft'],
	['industrialLight01', 'soft'],
	['sconce1Light', 'soft'],
	['industrialLight02', 'soft'],
	['industrialLight02Red', 'soft'],
	['ceilingFanLight', 'soft'],
	['chandelierLight', 'soft'],
	['candelabraLight', 'soft'],
	['signExitLight', 'soft'],
	['roadBarricadeLight', 'soft'],
	['deskLampLight', 'soft'],
	['tableLampLight', 'soft'],
	['tableLampTippedOverLight', 'soft'],
	['workLightPOI', 'soft'],
	['streetLight01', 'soft'],
	['streetLightClassic', 'soft'],
	['spotlightNailedDownPOI', 'soft'],

);

my %options = (
);

print "<configs>\n";

sub printProperty {
	print "\t\t", '<property name="', $_[0], '" value="', $_[1], '"/>', "\n";
}

foreach my $light (@lights) {
	print "\t<append xpath=\"/blocks/block[\@name='$light->[0]']\">\n";
	printProperty('LightShadow', $light->[1]);
	foreach my $key (keys %{$options{$light->[0]} || {}}) {
		printProperty($key, $options{$light->[0]}->{$key});
	}
	print "\t</append>\n";
}

print "</configs>\n";
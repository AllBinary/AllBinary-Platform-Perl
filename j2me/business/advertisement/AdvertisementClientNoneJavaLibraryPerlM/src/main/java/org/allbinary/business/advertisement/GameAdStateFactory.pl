# Generated Code Do Not Modify

package org::allbinary::business::advertisement::GameAdStateFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::advertisement::GameAdStateFactoryInterface';

our $instance = 'org::allbinary::business::advertisement::GameAdStateFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{gameAdStateArray} = ['org::allbinary::game::GameAdState'->new('org::allbinary::business::advertisement::AppNameLicensingAdConfiguration'->new())];
    $self->{gameAdState} = $self->{gameAdStateArray}->[0];
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::advertisement::GameAdStateFactory::instance;
}


sub getCurrentInstance {
    my ($self) = @_;
        return $self->{gameAdState};
}


# throws Exception
sub getInstanceForApp {
    my ($self, $softwareInformation) = @_;
        $self->{gameAdState} = $self->{gameAdStateArray}->[0];
        return $self->{gameAdStateArray}->[0];
}


sub isEnabled {
    my ($self) = @_;
        return 0;
}

use org::allbinary::game::GameAdState;
use org::allbinary::logic::system::SoftwareInformation;
use org::allbinary::business::advertisement::GameAdStateFactoryInterface;
use org::allbinary::business::advertisement::AppNameLicensingAdConfiguration;

1;


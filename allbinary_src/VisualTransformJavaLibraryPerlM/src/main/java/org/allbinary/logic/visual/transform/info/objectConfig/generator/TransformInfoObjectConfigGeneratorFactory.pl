#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGeneratorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGeneratorFactoryInterface';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGeneratorFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGeneratorFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


# throws Exception
sub getInstance_j1 {
    my ($self, $transformInfoInterface) = @_;
        my $type = $transformInfoInterface->getObjectConfigInterface()->getOutputTypeName();
        if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{VIEW})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF("Generating Instance for type: " . $type, $self, $commonStrings->{GET_INSTANCE});
        }
        if (!defined($type) || ($type cmp 'org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{RESPONSE}) == 0 || $transformInfoInterface->isChild()) {
            return 'org::allbinary::logic::visual::transform::info::objectConfig::generator::BasicGenerator'->new();
        } elsif (($type cmp 'org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{FILE}) == 0) {
            return 'org::allbinary::logic::visual::transform::info::objectConfig::generator::StoreFileGenerator'->new($transformInfoInterface);
        } else {
            die ("No Such TransformInfoObjectConfigGenerator Type");
        }
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::io::InputOutputTypeData ();
use org::allbinary::logic::visual::transform::info::TransformInfoInterface ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();
use org::allbinary::logic::visual::transform::info::objectConfig::generator::StoreFileGenerator ();

1;


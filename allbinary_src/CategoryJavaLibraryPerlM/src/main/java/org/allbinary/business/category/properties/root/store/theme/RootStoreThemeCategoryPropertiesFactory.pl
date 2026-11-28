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

package org::allbinary::business::category::properties::root::store::theme::RootStoreThemeCategoryPropertiesFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::business::category::properties::CategoryPropertiesFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{categoryPropertiesInterface} = undef unless exists $self->{categoryPropertiesInterface};
}

sub new {
    my ($class, @arguments) = @_;
    return _new1($class, @arguments) if scalar(@arguments) == 1;
    return _new2($class, @arguments) if scalar(@arguments) == 2;
    return _new2($class, @arguments) if scalar(@arguments) == 2;
    return _new2($class, @arguments) if scalar(@arguments) == 2;
    die "No constructor of RootStoreThemeCategoryPropertiesFactory takes " . scalar(@arguments) . " arguments";
}

sub _new2 {
    my ($class, @arguments) = @_;
    return _new2_1($class, @arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return _new2_2($class, @arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return _new2_3($class, @arguments);
}


sub _new1 {
    my ($class, $transformInfoInterface) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{categoryPropertiesInterface} = 'org::allbinary::business::category::properties::root::store::theme::RootStoreThemeCategoryProperties'->new($transformInfoInterface);
    return $self;
}


sub _new2_1 {
    my ($class, $transformInfoInterface, $abPath) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{categoryPropertiesInterface} = 'org::allbinary::business::category::properties::root::store::theme::RootStoreThemeCategoryProperties'->new($transformInfoInterface, $abPath);
    return $self;
}


sub _new2_2 {
    my ($class, $transformInfoInterface, $node) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{categoryPropertiesInterface} = 'org::allbinary::business::category::properties::root::store::theme::RootStoreThemeCategoryProperties'->new($transformInfoInterface, $node);
    return $self;
}


sub _new2_3 {
    my ($class, $transformInfoInterface, $categoryPropertiesHashMap) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{categoryPropertiesInterface} = 'org::allbinary::business::category::properties::root::store::theme::RootStoreThemeCategoryProperties'->new($transformInfoInterface, $categoryPropertiesHashMap);
    return $self;
}


sub getInstance {
    my ($self) = @_;
        try {
            return $self->{categoryPropertiesInterface};
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            return undef;
        }
}

use java::lang::Object ();
use java::util::HashMap ();
use org::allbinary::business::category::properties::CategoryPropertiesFactoryInterface ();
use org::allbinary::business::category::properties::CategoryPropertiesInterface ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::io::path::AbPath ();
use org::allbinary::logic::visual::transform::info::TransformInfoInterface ();
use org::allbinary::string::CommonStrings ();
use org::w3c::dom::Node ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();
use org::allbinary::business::category::properties::root::store::theme::RootStoreThemeCategoryProperties ();

1;


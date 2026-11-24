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

package org::allbinary::business::category::store::theme::StoreThemeCategoryFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::business::category::CategoryFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{transformInfoInterface} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{CATEGORY})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "StoreCategoryFactory(TransformInfoInterface transformInfoInterface)");
        }
        $self->{transformInfoInterface} = $transformInfoInterface;
    return $self;
}


sub getRootInstance_j0 {
    my ($self) = @_;
        try {
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::root::store::theme::RootStoreThemeCategoryPropertiesFactory'->new($self->{transformInfoInterface});
            return 'org::allbinary::business::category::store::theme::StoreThemeCategory'->new($self->{transformInfoInterface}, $categoryPropertiesFactoryInterface, 0);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getRootInstance()", $e);
            }
            return undef;
        }
}


sub getRootInstance_j1 {
    my ($self, $categoryAbPath) = @_;
        try {
            my $level = 'org::allbinary::business::category::CategoryUtil'->getPathLevel($categoryAbPath);
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::root::store::theme::RootStoreThemeCategoryPropertiesFactory'->new($self->{transformInfoInterface}, $categoryAbPath);
            return 'org::allbinary::business::category::store::theme::StoreThemeCategory'->new($self->{transformInfoInterface}, $categoryPropertiesFactoryInterface, $level);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getRootInstance(String)", $e);
            }
            return undef;
        }
}

sub getRootInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getRootInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getRootInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getRootInstance takes " . scalar(@arguments) . " arguments";
}


sub getRootInstanceFromNode {
    my ($self, $node) = @_;
        try {
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::root::store::theme::RootStoreThemeCategoryPropertiesFactory'->new($self->{transformInfoInterface}, $node);
            my $categoryPath = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::business::category::CategoryUtil'->getNameFromNode($node), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            my $level = 'org::allbinary::business::category::CategoryUtil'->getPathLevel($categoryPath);
            return 'org::allbinary::business::category::store::theme::StoreThemeCategory'->new($self->{transformInfoInterface}, $node, $categoryPropertiesFactoryInterface, $level);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getRootInstance(node)", $e);
            }
            return undef;
        }
}


sub getInstance_j2_1 {
    my ($self, $categoryPath, $level) = @_;
        try {
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::CategoryPropertiesFactory'->new($categoryPath);
            return 'org::allbinary::business::category::store::theme::StoreThemeCategory'->new($self->{transformInfoInterface}, $categoryPropertiesFactoryInterface, $level);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(String, int)", $e);
            }
            return undef;
        }
}


sub getInstance_j3_1 {
    my ($self, $rootCategoryInterface, $parentCategoryInterface, $categoryPath) = @_;
        try {
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::CategoryPropertiesFactory'->new($categoryPath);
            return 'org::allbinary::business::category::store::theme::StoreThemeCategory'->new($self->{transformInfoInterface}, $rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesFactoryInterface);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(CategoryInterface, CategoryInterface , String, int)", $e);
            }
            return undef;
        }
}


sub getInstance_j2_2 {
    my ($self, $node, $level) = @_;
        try {
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::CategoryPropertiesFactory'->new($node);
            return 'org::allbinary::business::category::store::theme::StoreThemeCategory'->new($self->{transformInfoInterface}, $categoryPropertiesFactoryInterface, $level);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(Node, int)", $e);
            }
            return undef;
        }
}


sub getInstance_j3_2 {
    my ($self, $rootCategoryInterface, $parentCategoryInterface, $node) = @_;
        try {
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::CategoryPropertiesFactory'->new($node);
            return 'org::allbinary::business::category::store::theme::StoreThemeCategory'->new($self->{transformInfoInterface}, $rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesFactoryInterface);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(CategoryInterface, CategoryInterface, Node, int)", $e);
            }
            return undef;
        }
}


sub getInstance_j2_3 {
    my ($self, $categoryPropertiesHashMap, $level) = @_;
        try {
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::CategoryPropertiesFactory'->new($categoryPropertiesHashMap);
            return 'org::allbinary::business::category::store::theme::StoreThemeCategory'->new($self->{transformInfoInterface}, $categoryPropertiesFactoryInterface, $level);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(HashMap)", $e);
            }
            return undef;
        }
}


sub getInstance_j3_3 {
    my ($self, $rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesHashMap) = @_;
        try {
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::CategoryPropertiesFactory'->new($categoryPropertiesHashMap);
            return 'org::allbinary::business::category::store::theme::StoreThemeCategory'->new($self->{transformInfoInterface}, $rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesFactoryInterface);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(CategoryInterface, CategoryInterface, HashMap)", $e);
            }
            return undef;
        }
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->getInstance_j3(@arguments) if scalar(@arguments) == 3;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

sub getInstance_j2 {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j2_1(@arguments) if 1 && !ref($arguments[0]) && !ref($arguments[1]);
    return $invocant->getInstance_j2_2(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && !ref($arguments[1]);
    return $invocant->getInstance_j2_3(@arguments);
}

sub getInstance_j3 {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j3_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY')) && !ref($arguments[2]);
    return $invocant->getInstance_j3_2(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY')) && (!defined($arguments[2]) || (ref($arguments[2]) && ref($arguments[2]) ne 'ARRAY'));
    return $invocant->getInstance_j3_3(@arguments);
}

use java::lang::Object ();
use java::util::HashMap ();
use org::allbinary::business::category::CategoryFactoryInterface ();
use org::allbinary::business::category::CategoryInterface ();
use org::allbinary::business::category::CategoryUtil ();
use org::allbinary::business::category::properties::CategoryPropertiesFactory ();
use org::allbinary::business::category::properties::CategoryPropertiesFactoryInterface ();
use org::allbinary::business::category::properties::root::store::theme::RootStoreThemeCategoryPropertiesFactory ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::io::path::AbPath ();
use org::allbinary::logic::string::StringUtil ();
use org::allbinary::logic::visual::transform::info::TransformInfoInterface ();
use org::allbinary::string::CommonStrings ();
use org::w3c::dom::Node ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();
use org::allbinary::business::category::store::theme::StoreThemeCategory ();

1;


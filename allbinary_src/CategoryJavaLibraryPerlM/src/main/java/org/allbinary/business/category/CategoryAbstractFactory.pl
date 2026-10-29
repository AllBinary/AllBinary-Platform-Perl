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

package org::allbinary::business::category::CategoryAbstractFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::CategoryFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getRootInstance {
    my ($self) = @_;
        die ("RuntimeException");
}


# Java overloaded method: Perl keeps the last definition
sub getRootInstance {
    my ($self, $categoryAbPath) = @_;
        die ("RuntimeException");
}


sub getRootInstanceFromNode {
    my ($self, $node) = @_;
        die ("RuntimeException");
}


sub getInstance {
    my ($self, $categoryName) = @_;
        try {
            if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getInstance(String)");
            }
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::CategoryPropertiesFactory'->new($categoryName);
            return 'org::allbinary::business::category::Category'->new($categoryPropertiesFactoryInterface);
        } catch ($e) {
            if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(String, int)", $e);
            }
            return undef;
        }
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $rootCategoryInterface, $parentCategoryInterface, $categoryName) = @_;
        try {
            if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getInstance(CategoryInterface, CategoryInterface, String)");
            }
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::CategoryPropertiesFactory'->new($categoryName);
            return 'org::allbinary::business::category::Category'->new($rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesFactoryInterface);
        } catch ($e) {
            if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(CategoryInterface, CategoryInterface , String, int)", $e);
            }
            return undef;
        }
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $node) = @_;
        try {
            if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getInstance(Node)");
            }
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::CategoryPropertiesFactory'->new($node);
            return 'org::allbinary::business::category::Category'->new($categoryPropertiesFactoryInterface);
        } catch ($e) {
            if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(Node, int)", $e);
            }
            return undef;
        }
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $rootCategoryInterface, $parentCategoryInterface, $node) = @_;
        try {
            if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getInstance(CategoryInterface, CategoryInterface, Node)");
            }
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::CategoryPropertiesFactory'->new($node);
            return 'org::allbinary::business::category::Category'->new($rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesFactoryInterface);
        } catch ($e) {
            if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(CategoryInterface, CategoryInterface, Node, int)", $e);
            }
            return undef;
        }
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesHashMap) = @_;
        try {
            if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getInstance(CategoryInterface, CategoryInterface, HashMap)");
            }
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::CategoryPropertiesFactory'->new($categoryPropertiesHashMap);
            return 'org::allbinary::business::category::Category'->new($rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesFactoryInterface);
        } catch ($e) {
            if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(CategoryInterface, CategoryInterface, HashMap)", $e);
            }
            return undef;
        }
}

use java::util::HashMap;
use org::allbinary::business::category::properties::CategoryPropertiesFactory;
use org::allbinary::business::category::properties::CategoryPropertiesFactoryInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Node;
use org::allbinary::business::category::CategoryFactoryInterface;
use org::allbinary::business::category::Category;

1;


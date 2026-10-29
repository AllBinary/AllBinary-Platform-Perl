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

package org::allbinary::business::category::store::StoreCategoryFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::CategoryAbstractFactory','org::allbinary::business::category::CategoryFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{transformInfoInterface} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        if ($org::allbinary::business::category::store::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::store::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "StoreCategoryFactory(TransformInfoInterface transformInfoInterface)");
        }
        $self->{transformInfoInterface} = $transformInfoInterface;
    return $self;
}


sub getRootInstance {
    my ($self) = @_;
        try {
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::root::store::RootStoreCategoryPropertiesFactory'->new($self->{transformInfoInterface});
            return 'org::allbinary::business::category::Category'->new($categoryPropertiesFactoryInterface);
        } catch ($e) {
            if ($org::allbinary::business::category::store::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::store::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(String, int)", $e);
            }
            return undef;
        }
}


# Java overloaded method: Perl keeps the last definition
sub getRootInstance {
    my ($self, $categoryPath) = @_;
        try {
            my $level = 'org::allbinary::business::category::CategoryUtil'->getPathLevel($categoryPath);
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::root::store::RootStoreCategoryPropertiesFactory'->new($self->{transformInfoInterface}, $categoryPath);
            return 'org::allbinary::business::category::Category'->new($categoryPropertiesFactoryInterface, $level);
        } catch ($e) {
            if ($org::allbinary::business::category::store::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::store::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(String, int)", $e);
            }
            return undef;
        }
}


sub getRootInstanceFromNode {
    my ($self, $node) = @_;
        try {
            my $categoryPropertiesFactoryInterface = 'org::allbinary::business::category::properties::root::store::RootStoreCategoryPropertiesFactory'->new($self->{transformInfoInterface}, $node);
            my $categoryPath = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::business::category::CategoryUtil'->getNameFromNode($node), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            my $level = 'org::allbinary::business::category::CategoryUtil'->getPathLevel($categoryPath);
            return 'org::allbinary::business::category::Category'->new($categoryPropertiesFactoryInterface, $level);
        } catch ($e) {
            if ($org::allbinary::business::category::store::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::store::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{ENTITYFACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getInstance(String, int)", $e);
            }
            return undef;
        }
}

use org::allbinary::business::category::Category;
use org::allbinary::business::category::CategoryAbstractFactory;
use org::allbinary::business::category::CategoryFactoryInterface;
use org::allbinary::business::category::CategoryInterface;
use org::allbinary::business::category::CategoryUtil;
use org::allbinary::business::category::properties::CategoryPropertiesFactoryInterface;
use org::allbinary::business::category::properties::root::store::RootStoreCategoryPropertiesFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Node;

1;


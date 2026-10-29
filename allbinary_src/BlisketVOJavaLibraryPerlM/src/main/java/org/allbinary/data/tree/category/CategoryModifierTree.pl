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

package org::allbinary::data::tree::category::CategoryModifierTree;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::category::CategoryPrivateTree','org::allbinary::data::tree::category::CategoryModifierTreeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{directory} = 'org::allbinary::logic::io::file::directory::Directory'->getInstance();
}


sub new {
    my ($class, $categoryFactoryInterface) = @_;
    my $self = $class->SUPER::new($categoryFactoryInterface);
    $self->_init_fields();
        # super(...) made $self above
        if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "CategoryModifierTree(CategoryFactoryInterface categoryFactoryInterface)");
        }
    return $self;
}


sub insert {
    my ($self, $parentCategoryInterface, $newChildCategoryInterface) = @_;
        try {
            if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
                $self->{logUtil}->putF("Inserting", $self, "insert()");
            }
            if ($parentCategoryInterface->isValid()) {
                $parentCategoryInterface->addChild($newChildCategoryInterface);
                my $directoryToBeCreatedAbPath = 'org::allbinary::logic::io::path::AbPath'->new($newChildCategoryInterface->getRootFilePath()->toString() . $newChildCategoryInterface->getPath()->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
                $self->{directory}->create($directoryToBeCreatedAbPath);
                if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
                    $self->{logUtil}->putF("Saving", $self, "insert()");
                }
                $self->save($parentCategoryInterface);
                $self->save($newChildCategoryInterface);
            } else {
                die ("Will Not Add Null Category");
            }
        } catch ($e) {
            if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "insert", $e);
            }
        }
}


sub delete {
    my ($self, $parentCategoryInterface, $existingChildCategoryInterface) = @_;
        try {
            if ($parentCategoryInterface->isValid()) {
                $parentCategoryInterface->addChild($existingChildCategoryInterface);
                my $directoryToBeDeletedAbPath = 'org::allbinary::logic::io::path::AbPath'->new($existingChildCategoryInterface->getRootFilePath()->toString() . $existingChildCategoryInterface->getPath()->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
                $self->delete($existingChildCategoryInterface);
                $parentCategoryInterface->removeChild($existingChildCategoryInterface);
                $self->save($parentCategoryInterface);
                $self->{directory}->remove($directoryToBeDeletedAbPath);
            } else {
                die ("Will Not Add Null Category");
            }
        } catch ($e) {
            if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{delete}, $e);
            }
        }
}

use org::allbinary::business::category::CategoryFactoryInterface;
use org::allbinary::business::category::CategoryInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::directory::Directory;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::data::tree::category::CategoryPrivateTree;
use org::allbinary::data::tree::category::CategoryModifierTreeInterface;

1;


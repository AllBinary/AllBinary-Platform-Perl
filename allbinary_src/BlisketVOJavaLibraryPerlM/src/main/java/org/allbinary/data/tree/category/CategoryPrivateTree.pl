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

package org::allbinary::data::tree::category::CategoryPrivateTree;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{categoryFactoryInterface} = undef;
}


sub new {
    my ($class, $categoryFactoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{START}, $self, "CategoryPrivateTree(CategoryFactoryInterface categoryFactoryInterface)");
        }
        $self->{categoryFactoryInterface} = $categoryFactoryInterface;
    return $self;
}


# throws Exception
sub save {
    my ($self, $categoryInterface) = @_;
        if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
            $self->{logUtil}->putF("Saving Category File: " . $categoryInterface->getFilePath(), $self, "save()");
        }
        my $document = 'org::allbinary::business::category::CategoryComponent'->new($categoryInterface)->toXmlDoc();
        my $cryptFileWriter = 'org::allbinary::logic::control::crypt::file::CryptFileWriter'->new('org::allbinary::business::category::CategoryData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::business::category::CategoryData'->getInstance()->{ENCRYPTED_EXTENSION});
        $cryptFileWriter->write($categoryInterface->getFilePath(), $document);
        if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
            $self->{logUtil}->putF("end", $self, "save()");
        }
}


# throws Exception
sub delete {
    my ($self, $categoryInterface) = @_;
        if ($categoryInterface->isLeaf()) {
            my $categoryFile = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($categoryInterface->getFilePath());
            if ($categoryFile->delete()) {
                if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $self->{logUtil}->putF("Removed: " . $categoryInterface->getFilePath(), $self, "delete(CategoryInterface)");
                }
            }
        } else {
            if ($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tree::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF("Not a leaf unable to remove", $self, "delete(CategoryInterface)");
            }
        }
}

use org::allbinary::business::category::CategoryComponent;
use org::allbinary::business::category::CategoryData;
use org::allbinary::business::category::CategoryFactoryInterface;
use org::allbinary::business::category::CategoryInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::crypt::file::CryptFileWriter;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;

1;


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

package org::allbinary::business::user::commerce::inventory::item::download::DownloadableItemValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::Validation';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{downloadableItem} = undef;
}


sub new {
    my ($class, $downloadableItem) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{downloadableItem} = $downloadableItem;
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            if (!defined($self->{downloadableItem}->getId()) || $self->{downloadableItem}->getId()->length() < 1 || $self->{downloadableItem}->getId()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                return 0;
            }
            if (defined($self->{downloadableItem}->getId()) && !'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isNumber($self->{downloadableItem}->getId())) {
                return 0;
            }
            if (!defined($self->{downloadableItem}->getSystem()) || $self->{downloadableItem}->getSystem()->length() < 1 || $self->{downloadableItem}->getSystem()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                return 0;
            }
            if (!defined($self->{downloadableItem}->getPlatform()) || $self->{downloadableItem}->getPlatform()->length() < 1 || $self->{downloadableItem}->getPlatform()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                return 0;
            }
            if (!defined($self->{downloadableItem}->getSpecialName()) || $self->{downloadableItem}->getSpecialName()->length() < 0 || $self->{downloadableItem}->getSpecialName()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                return 0;
            }
            if (!defined($self->{downloadableItem}->getVersion()) || $self->{downloadableItem}->getVersion()->length() < 1 || $self->{downloadableItem}->getVersion()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                return 0;
            }
            if (!defined($self->{downloadableItem}->getChanges()) || $self->{downloadableItem}->getChanges()->length() < 1 || $self->{downloadableItem}->getChanges()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                return 0;
            }
            if (!defined($self->{downloadableItem}->getSize())) {
                return 0;
            } else {
                my $size = $self->{downloadableItem}->getSize()->toString();
                if (length($size) < 1 || length($size) > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                    return 0;
                }
            }
            if (!defined($self->{downloadableItem}->getValidTime())) {
                return 0;
            } else {
                my $size = $self->{downloadableItem}->getValidTime()->toString();
                if (length($size) < 1 || length($size) > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                    return 0;
                }
            }
            if (!defined($self->{downloadableItem}->getRetries())) {
                return 0;
            } else {
                my $size = $self->{downloadableItem}->getRetries()->toString();
                if (length($size) < 1 || length($size) > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                    return 0;
                }
            }
            return 1;
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::inventory::item::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::item::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if (!defined($self->{downloadableItem}->getId()) || $self->{downloadableItem}->getId()->length() < 1 || $self->{downloadableItem}->getId()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                $stringBuffer->append("Id is invalid. Must be number < ");
                $stringBuffer->appendint(int($org::allbinary::logic::communication::sql::AbSqlData::MAXNUM));
                $stringBuffer->append(" and > 0 digits.<br/>");
            }
            if (defined($self->{downloadableItem}->getId()) && !'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isNumber($self->{downloadableItem}->getId())) {
                $stringBuffer->append("Id is invalid. Must be > 0.<br/>");
            }
            if (!defined($self->{downloadableItem}->getSystem()) || $self->{downloadableItem}->getSystem()->length() < 1 || $self->{downloadableItem}->getSystem()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                $stringBuffer->append("System value is invalid. Must be < ");
                $stringBuffer->appendint(int($org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING));
                $stringBuffer->append(" and > 0 characters long.<br/>");
            }
            if (!defined($self->{downloadableItem}->getPlatform()) || $self->{downloadableItem}->getPlatform()->length() < 1 || $self->{downloadableItem}->getPlatform()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                $stringBuffer->append("Platform value is invalid. Must be < ");
                $stringBuffer->appendint(int($org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING));
                $stringBuffer->append(" and > 0 characters long.<br/>");
            }
            if (!defined($self->{downloadableItem}->getSpecialName()) || $self->{downloadableItem}->getSpecialName()->length() < 0 || $self->{downloadableItem}->getSpecialName()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                $stringBuffer->append("Special Name value is invalid. Must be < ");
                $stringBuffer->appendint(int($org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING));
                $stringBuffer->append(" and > 0 characters long.<br/>");
            }
            if (!defined($self->{downloadableItem}->getVersion()) || $self->{downloadableItem}->getVersion()->length() < 1 || $self->{downloadableItem}->getVersion()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                $stringBuffer->append("Version value is invalid. Must be < ");
                $stringBuffer->appendint(int($org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING));
                $stringBuffer->append(" and > 0 characters long.<br/>");
            }
            if (!defined($self->{downloadableItem}->getChanges()) || $self->{downloadableItem}->getChanges()->length() < 0 || $self->{downloadableItem}->getChanges()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                $stringBuffer->append("Changes value is invalid. Must be < ");
                $stringBuffer->appendint(int($org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB));
                $stringBuffer->append(" and >= 0 characters long.<br/>");
            }
            if (!defined($self->{downloadableItem}->getSize())) {
                $stringBuffer->append("File Size is null");
            } else {
                my $size = $self->{downloadableItem}->getSize()->toString();
                if (length($size) < 1 || length($size) > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                    $stringBuffer->append("File Size is invalid. Must be number < ");
                    $stringBuffer->appendint(int($org::allbinary::logic::communication::sql::AbSqlData::MAXNUM));
                    $stringBuffer->append(" and > 0 digits.<br/>");
                }
            }
            if (!defined($self->{downloadableItem}->getValidTime())) {
                $stringBuffer->append("Valid Time is null");
            } else {
                my $size = $self->{downloadableItem}->getValidTime()->toString();
                if (length($size) < 1 || length($size) > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                    $stringBuffer->append("Valid Time is invalid. Must be number < ");
                    $stringBuffer->appendint(int($org::allbinary::logic::communication::sql::AbSqlData::MAXNUM));
                    $stringBuffer->append(" and > 0 digits.<br/>");
                }
            }
            if (!defined($self->{downloadableItem}->getRetries())) {
                $stringBuffer->append("Retries is null");
            } else {
                my $size = $self->{downloadableItem}->getRetries()->toString();
                if (length($size) < 1 || length($size) > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                    $stringBuffer->append("Retries is invalid. Must be number < ");
                    $stringBuffer->appendint(int($org::allbinary::logic::communication::sql::AbSqlData::MAXNUM));
                    $stringBuffer->append(" and > 0 digits.<br/>");
                }
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::inventory::item::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::item::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Validating Form";
        }
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlData;
use org::allbinary::logic::control::validate::Validation;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;

1;


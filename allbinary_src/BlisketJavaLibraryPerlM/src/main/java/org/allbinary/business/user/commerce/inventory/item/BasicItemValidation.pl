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

package org::allbinary::business::user::commerce::inventory::item::BasicItemValidation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::Validation';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{MAXWEIGHT} = 14;
    $self->{MAXPRICE} = 14;
    $self->{itemInterface} = undef;
}


sub new {
    my ($class, $itemInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{itemInterface} = $itemInterface;
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            if (!defined($self->{itemInterface}->getId()) || $self->{itemInterface}->getId()->length() < 1 || $self->{itemInterface}->getId()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                return 0;
            }
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            if (defined($self->{itemInterface}->getId()) && !$stringValidationUtil->isNumber($self->{itemInterface}->getId())) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getNumber()) || $self->{itemInterface}->getNumber()->length() < 1 || $self->{itemInterface}->getNumber()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                return 0;
            }
            if (defined($self->{itemInterface}->getNumber()) && !$stringValidationUtil->isNumber($self->{itemInterface}->getNumber())) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getInBaskets()) || $self->{itemInterface}->getInBaskets()->length() < 1 || $self->{itemInterface}->getInBaskets()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                return 0;
            }
            if (defined($self->{itemInterface}->getInBaskets()) && !$stringValidationUtil->isNumber($self->{itemInterface}->getInBaskets())) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getWeight()) || $self->{itemInterface}->getWeight()->length() < 1 || $self->{itemInterface}->getWeight()->length() > $self->{MAXWEIGHT}) {
                return 0;
            }
            if (defined($self->{itemInterface}->getWeight()) && !$stringValidationUtil->isNumber($self->{itemInterface}->getWeight())) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getEnabled()) || $self->{itemInterface}->getEnabled()->length() < 1 || $self->{itemInterface}->getEnabled()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getNewOrUsed()) || $self->{itemInterface}->getNewOrUsed()->length() < 1 || $self->{itemInterface}->getNewOrUsed()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getSummary()) || $self->{itemInterface}->getSummary()->length() < 1 || $self->{itemInterface}->getSummary()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getDescription()) || $self->{itemInterface}->getDescription()->length() < 1 || $self->{itemInterface}->getDescription()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getKeywords()) || $self->{itemInterface}->getKeywords()->length() < 1 || $self->{itemInterface}->getKeywords()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getCategory()) || $self->{itemInterface}->getCategory()->length() < 1 || $self->{itemInterface}->getCategory()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getType()) || $self->{itemInterface}->getType()->length() < 1 || $self->{itemInterface}->getType()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getPrice()) || !$self->{itemInterface}->getPrice()->isValid()) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getCustoms()) || $self->{itemInterface}->getCustoms()->length() < 1 || $self->{itemInterface}->getCustoms()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getDownloads()) || $self->{itemInterface}->getDownloads()->length() < 1 || $self->{itemInterface}->getDownloads()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getGroups()) || $self->{itemInterface}->getGroups()->length() < 1 || $self->{itemInterface}->getGroups()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getOptions()) || $self->{itemInterface}->getOptions()->length() < 1 || $self->{itemInterface}->getOptions()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getPermissions()) || $self->{itemInterface}->getPermissions()->length() < 1 || $self->{itemInterface}->getPermissions()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                return 0;
            }
            if (!defined($self->{itemInterface}->getSpecials()) || $self->{itemInterface}->getSpecials()->length() < 1 || $self->{itemInterface}->getSpecials()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                return 0;
            }
            return 1;
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if (!defined($self->{itemInterface}->getId()) || $self->{itemInterface}->getId()->length() < 1 || $self->{itemInterface}->getId()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                $stringBuffer->append("Id is invalid. Must be number < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM . " and > 0 digits.<br />");
            }
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            if (defined($self->{itemInterface}->getId()) && !$stringValidationUtil->isNumber($self->{itemInterface}->getId())) {
                $stringBuffer->append("Id is invalid. Must be > 0.<br />");
            }
            if (!defined($self->{itemInterface}->getNumber()) || $self->{itemInterface}->getNumber()->length() < 1 || $self->{itemInterface}->getNumber()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                $stringBuffer->append("Number of items is invalid. Must be number < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM . " and > 0 digits.<br />");
            }
            if (defined($self->{itemInterface}->getNumber()) && !$stringValidationUtil->isNumber($self->{itemInterface}->getNumber())) {
                $stringBuffer->append("Number of items value is not a valid number.<br />");
            }
            if (!defined($self->{itemInterface}->getInBaskets()) || $self->{itemInterface}->getInBaskets()->length() < 1 || $self->{itemInterface}->getInBaskets()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                $stringBuffer->append("Number in baskets is invalid. Must be < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM . " and > 0 digits.<br />");
            }
            if (defined($self->{itemInterface}->getInBaskets()) && !$stringValidationUtil->isNumber($self->{itemInterface}->getInBaskets())) {
                $stringBuffer->append("In Baskets value is not a valid number.<br />");
            }
            if (!defined($self->{itemInterface}->getWeight()) || $self->{itemInterface}->getWeight()->length() < 1 || $self->{itemInterface}->getWeight()->length() > $self->{MAXWEIGHT}) {
                $stringBuffer->append("Weight value is invalid. Must be < " . $self->{MAXWEIGHT} . " and > 0 digits.<br />");
            }
            if (defined($self->{itemInterface}->getWeight()) && !$stringValidationUtil->isNumber($self->{itemInterface}->getWeight())) {
                $stringBuffer->append("Weight value is not a valid number.<br />");
            }
            if (!defined($self->{itemInterface}->getEnabled()) || $self->{itemInterface}->getEnabled()->length() < 1 || $self->{itemInterface}->getEnabled()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                $stringBuffer->append("For Sale value is invalid. Must be < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING . " and > 0 characters long.<br />");
            }
            if (!defined($self->{itemInterface}->getNewOrUsed()) || $self->{itemInterface}->getNewOrUsed()->length() < 1 || $self->{itemInterface}->getNewOrUsed()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                $stringBuffer->append("New Or Used value is invalid. Must be < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING . " and > 0 characters long.<br />");
            }
            if (!defined($self->{itemInterface}->getSummary()) || $self->{itemInterface}->getSummary()->length() < 1 || $self->{itemInterface}->getSummary()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                $stringBuffer->append("Summary value is invalid. Must be < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING . " and > 0 characters long.<br />");
            }
            if (!defined($self->{itemInterface}->getDescription()) || $self->{itemInterface}->getDescription()->length() < 1 || $self->{itemInterface}->getDescription()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                $stringBuffer->append("Description value is invalid. Must be < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB . " and > 0 characters long.<br />");
            }
            if (!defined($self->{itemInterface}->getKeywords()) || $self->{itemInterface}->getKeywords()->length() < 1 || $self->{itemInterface}->getKeywords()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                $stringBuffer->append("Keywords value is invalid. Must be < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING . " and > 0 characters long.<br />");
            }
            if (!defined($self->{itemInterface}->getCategory()) || $self->{itemInterface}->getCategory()->length() < 1 || $self->{itemInterface}->getCategory()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                $stringBuffer->append("Category value is invalid. Must be < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING . " and > 0 characters long.<br />");
            }
            if (!defined($self->{itemInterface}->getType()) || $self->{itemInterface}->getType()->length() < 1 || $self->{itemInterface}->getType()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING) {
                $stringBuffer->append("Type value is invalid. Must be < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXSTRING . " and > 0 characters long.<br />");
            }
            if (!defined($self->{itemInterface}->getPrice()) || !$self->{itemInterface}->getPrice()->isValid()) {
                $stringBuffer->append("Price value is invalid. Must be < " . $self->{MAXPRICE} . " and > 0 in length.<br />");
            }
            if (!defined($self->{itemInterface}->getCustoms()) || $self->{itemInterface}->getCustoms()->length() < 1 || $self->{itemInterface}->getCustoms()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                $stringBuffer->append("Custom items value is invalid. Must be number < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM . " and > 0 digits.<br />");
            }
            if (!defined($self->{itemInterface}->getDownloads()) || $self->{itemInterface}->getDownloads()->length() < 1 || $self->{itemInterface}->getDownloads()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                $stringBuffer->append("Downloadable item value is invalid. Must be number < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM . " and > 0 digits.<br />");
            }
            if (!defined($self->{itemInterface}->getGroups()) || $self->{itemInterface}->getGroups()->length() < 1 || $self->{itemInterface}->getGroups()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                $stringBuffer->append("Group item value is invalid. Must be number < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM . " and > 0 digits.<br />");
            }
            if (!defined($self->{itemInterface}->getOptions()) || $self->{itemInterface}->getOptions()->length() < 1 || $self->{itemInterface}->getOptions()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                $stringBuffer->append("Option item value is invalid. Must be number < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM . " and > 0 digits.<br />");
            }
            if (!defined($self->{itemInterface}->getPermissions()) || $self->{itemInterface}->getPermissions()->length() < 1 || $self->{itemInterface}->getPermissions()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                $stringBuffer->append("Permission item value is invalid. Must be number < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM . " and > 0 digits.<br />");
            }
            if (!defined($self->{itemInterface}->getSpecials()) || $self->{itemInterface}->getSpecials()->length() < 1 || $self->{itemInterface}->getSpecials()->length() > $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM) {
                $stringBuffer->append("Special item value is invalid. Must be number < " . $org::allbinary::logic::communication::sql::AbSqlData::MAXNUM . " and > 0 digits.<br />");
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::inventory::item::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
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


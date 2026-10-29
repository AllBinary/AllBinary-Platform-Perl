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

package admin::taghelpers::StoreFrontsHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::BasicTable';

our $CLASS = "class";
our $TEXT = "text";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{portion} = undef;
    $self->{commonPhoneStrings} = 'org::allbinary::string::CommonPhoneStrings'->getInstance();
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{portion} = 'org::allbinary::business::installer::Portion'->new($hashMap);
    return $self;
}


sub drop {
    my ($self) = @_;
        try {
            my $success = 'org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance()->dropTable();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, $self->{commonStrings}->{DROP});
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to drop storefronts table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{DROP}, $e);
            }
            return $error;
        }
}


sub create {
    my ($self) = @_;
        try {
            my $success = 'org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance()->createTable();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "create()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to create new storefronts table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "create()", $e);
            }
            return $error;
        }
}


sub restore {
    my ($self) = @_;
        try {
            my $success = "Restore Successful";
            my $result = 'org::allbinary::logic::communication::sql::AbSqlTableUtil'->getInstance()->restoreTable('org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance(), $self->{portion});
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "restore()");
            }
            return $result;
        } catch ($e) {
            my $error = "Failed to restore backup";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "restore()", $e);
            }
            return $error;
        }
}


sub backup {
    my ($self) = @_;
        try {
            my $success = "Restore Successful";
            my $result = 'org::allbinary::logic::communication::sql::AbSqlTableUtil'->getInstance()->backupTable('org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance());
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "backup()");
            }
            return $result;
        } catch ($e) {
            my $error = "Failed to make backup";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "backup()", $e);
            }
            return $error;
        }
}


sub generateSelect {
    my ($self) = @_;
        try {
            my $success = 'org::allbinary::string::CommonSeps'->getInstance()->{SPACE};
            my $storeNamesVector = 'org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance()->getStoreFrontNames();
            my $storeSelect = 'org::allbinary::logic::visual::dhtml::html::select::HtmlSelect'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $self->{commonPhoneStrings}->{ONE}, 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{SELECTSTORENAME}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            $storeSelect->addAttribute($admin::taghelpers::StoreFrontsHelper::CLASS, $admin::taghelpers::StoreFrontsHelper::TEXT);
            my $size = $storeNamesVector->size();
            for (my $index = 0; $index < $size; $index++) {
                my $storeName = $storeNamesVector->get($index);
                $storeSelect->addOption($storeName);
            }
            $success .= $storeSelect;
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "generateSelect()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to generate storefronts select";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "generateSelect()", $e);
            }
            return $error;
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::installer::Portion;
use org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlTableUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::dhtml::html::select::HtmlSelect;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonSeps;
use admin::taghelpers::BasicTable;

1;


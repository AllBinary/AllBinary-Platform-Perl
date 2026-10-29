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

package admin::taghelpers::AuthenticationHelperUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'admin::taghelpers::AuthenticationHelperUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $admin::taghelpers::AuthenticationHelperUtil::instance;
}


# throws Exception
sub isAuthorized {
    my ($self, $authenticationHelper, $filePath) = @_;
        if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
            $self->{logUtil}->putF('org::allbinary::string::CommonLabels'->getInstance()->{START} . $filePath, $self, "isAuthorized()");
        }
        my $endIndex = 'org::allbinary::logic::communication::http::request::HttpRequestUtil'->getInstance()->getLastSeparatorIndex($filePath);
        my $fullPath = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getWebappPath() . substr($filePath, 0, ($endIndex) - (0)), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        my $downloadFilePermissions = 'org::allbinary::logic::communication::http::file::upload::HttpFilePermissions'->new($fullPath);
        my $userRoles = $downloadFilePermissions->getUserRoles();
        my $userRole = $authenticationHelper->getRole();
        my $basicUserRole = $userRole->getBasicUserRole();
        if ($userRoles->contains($basicUserRole)) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Authorized", $self, "isAuthorized()");
            }
            return 1;
        } else {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Not Authorized: " . $basicUserRole->toString(), $self, "isAuthorized()");
            }
            return 0;
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::role::BasicUserRole;
use org::allbinary::business::user::role::UserRole;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::http::file::upload::HttpFilePermissions;
use org::allbinary::logic::communication::http::request::HttpRequestUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonLabels;

1;


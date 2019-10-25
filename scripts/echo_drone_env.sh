#!/usr/bin/env bash

echo "Drone Building With Env Variables:"
echo "DRONE: ${DRONE}"              # =true	environment is drone
echo "DRONE_ARCH: ${DRONE_ARCH}"  	       # environment architecture (linux/amd64)
echo "DRONE_REPO: ${DRONE_REPO}"  	       # repository full name
echo "DRONE_REPO_OWNER: ${DRONE_REPO_OWNER}"  	 # repository owner
echo "DRONE_REPO_NAME: ${DRONE_REPO_NAME}"  	   # repository name
echo "DRONE_REPO_SCM: ${DRONE_REPO_SCM}"  	   # repository scm (git)
echo "DRONE_REPO_LINK: ${DRONE_REPO_LINK}"  	   # repository link
echo "DRONE_REPO_AVATAR: ${DRONE_REPO_AVATAR}"  	 # repository avatar
echo "DRONE_REPO_BRANCH: ${DRONE_REPO_BRANCH}"  	 # repository default branch (master)
echo "DRONE_REPO_PRIVATE: ${DRONE_REPO_PRIVATE}"  # 	repository is private
echo "DRONE_REPO_TRUSTED: ${DRONE_REPO_TRUSTED}"  # 	repository is trusted
echo "DRONE_REMOTE_URL: ${DRONE_REMOTE_URL}"  # 	repository clone url
echo "DRONE_COMMIT_SHA: ${DRONE_COMMIT_SHA}"  # 	commit sha
echo "DRONE_COMMIT_REF: ${DRONE_COMMIT_REF}"  # 	commit ref
echo "DRONE_COMMIT_BRANCH: ${DRONE_COMMIT_BRANCH}"  # 	commit branch
echo "DRONE_COMMIT_LINK: ${DRONE_COMMIT_LINK}"  # 	commit link in remote
echo "DRONE_COMMIT_MESSAGE: ${DRONE_COMMIT_MESSAGE}"  # 	commit message
echo "DRONE_COMMIT_AUTHOR: ${DRONE_COMMIT_AUTHOR}"  # 	commit author username
echo "DRONE_COMMIT_AUTHOR_EMAIL: ${DRONE_COMMIT_AUTHOR_EMAIL}"  # 	commit author email address
echo "DRONE_COMMIT_AUTHOR_AVATAR: ${DRONE_COMMIT_AUTHOR_AVATAR}"  # 	commit author avatar
echo "DRONE_BUILD_NUMBER: ${DRONE_BUILD_NUMBER}"  # 	build number
echo "DRONE_BUILD_EVENT: ${DRONE_BUILD_EVENT}"  # 	build event (push, pull_request, tag)
echo "DRONE_BUILD_STATUS: ${DRONE_BUILD_STATUS}"  # 	build status (success, failure)
echo "DRONE_BUILD_LINK: ${DRONE_BUILD_LINK}"  # 	build result link
echo "DRONE_BUILD_CREATED: ${DRONE_BUILD_CREATED}"  # 	build created unix timestamp
echo "DRONE_BUILD_STARTED: ${DRONE_BUILD_STARTED}"  # 	build started unix timestamp
echo "DRONE_BUILD_FINISHED: ${DRONE_BUILD_FINISHED}"  # 	build finished unix timestamp
echo "DRONE_PREV_BUILD_STATUS: ${DRONE_PREV_BUILD_STATUS}" #  	prior build status
echo "DRONE_PREV_BUILD_NUMBER: ${DRONE_PREV_BUILD_NUMBER}" #  	prior build number
echo "DRONE_PREV_COMMIT_SHA: ${DRONE_PREV_COMMIT_SHA}"  # 	prior build commit sha
echo "DRONE_JOB_NUMBER: ${DRONE_JOB_NUMBER}"  # 	job number
echo "DRONE_JOB_STATUS: ${DRONE_JOB_STATUS}"  # 	job status
echo "DRONE_JOB_STARTED: ${DRONE_JOB_STARTED}"  # 	job started
echo "DRONE_JOB_FINISHED: ${DRONE_JOB_FINISHED}"  # 	job finished
echo "DRONE_BRANCH: ${DRONE_BRANCH}"  # 	commit branch
echo "DRONE_COMMIT: ${DRONE_COMMIT}" #  	commit sha
echo "DRONE_TAG: ${DRONE_TAG}"  # 	commit tag
echo "DRONE_PULL_REQUEST: ${DRONE_PULL_REQUEST}"  # 	pull request number
echo "DRONE_DEPLOY_TO: ${DRONE_DEPLOY_TO}"
echo "DRONE_DEPLOY_TO: ${DRONE_DEPLOY_TO}"
echo "DRONE_DEPLOY_TO: ${DRONE_DEPLOY_TO}"
echo "CI_COMMIT_SHA: ${CI_COMMIT_SHA}"
echo "CI_COMMIT_TAG: ${CI_COMMIT_TAG}"
echo "CI_COMMIT_BRANCH: ${CI_COMMIT_BRANCH}"
echo "CLUSTER_ENV: ${CLUSTER_ENV}"

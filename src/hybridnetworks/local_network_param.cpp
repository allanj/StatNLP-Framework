//
// Created by  ngs on 31/07/2018.
//

#include "local_network_param.h"
#include "common.h"
#include "network.h"

LocalNetworkParam::LocalNetworkParam() {

}

LocalNetworkParam::LocalNetworkParam(int threadId, FeatureManager *ptr_fm, int numNetworks) {
    this->thread_id_ = threadId;
    this->num_networks_ = numNetworks;
    this->ptr_fm_ = ptr_fm;
    //this->fs_ = NULL;
    this->ptr_globalFeature2LocalFeature_ = new std::unordered_map<int, int>();
    this->isFinalized_ = false;
    this->is_gobal_mode_ = false;
    // to be done for multithread
    if(!_CACHE_FEATURES_DURING_TRAINING){
        this->DisableCache();
    }
    if(Num_Of_Threads ==1){
        this->is_gobal_mode_ = true;
    }
}

LocalNetworkParam::~LocalNetworkParam() {

}

void LocalNetworkParam::DisableCache() {
    this->ptr_cache_ = NULL;
    this->is_cache_enabled_ = false;
}

int LocalNetworkParam::GetThreadId() {
    return thread_id_;
}

double LocalNetworkParam::GetWeight(int featureId) {
    if(this->IsGlobalMode()){
        return this->ptr_fm_->GetGlobalParam()->GetWeight(featureId);
    } else{
        return this->ptr_fm_->GetGlobalParam()->GetWeight((*this->ptr_fs_)[featureId]);
    }
}

bool LocalNetworkParam::IsGlobalMode() {
    return is_gobal_mode_;
}

void LocalNetworkParam::FinalizeIt() {
    if(this->IsGlobalMode()){
        this->isFinalized_ = true;
        return;
    }
    this->ptr_fs_ = new std::vector<int>(this->ptr_globalFeature2LocalFeature_->size());
    // to be confirmed for this part: global to local feature.
    for(auto it = this->ptr_globalFeature2LocalFeature_->begin(); it != ptr_globalFeature2LocalFeature_->end(); ++it){
        int f_global = (*it).first;
        int f_local = this->ptr_globalFeature2LocalFeature_->find(f_global)->second;
        (*ptr_fs_)[f_local] = f_global;
    }
    this->isFinalized_= true;
    this->ptr_counts_ = new std::vector<int>(this->ptr_fs_->size());
}

bool LocalNetworkParam::isCacheAble() {
    return is_cache_enabled_;
}

/**
 * Extract features from a hyperedge, which is denoted by the parent node parent_k (its index), the hyperedge index
 (as there are multiple hyper edges that is rooted by parent node parent_k), and the children_nodes of the

 * @param ptr_network : the network (graph)
 * @param parent_k : the index of parent node
 * @param ptr_children_k : the pointer of a hyperedge.
 * @param children_k_index : the index of the hyperedge, which is rooted by parent node.
 * @return
 */
FeatureArray* LocalNetworkParam::Extract(Network *ptr_network, int parent_k, int *ptr_children_k,
                                         int children_k_index) {
    if(this->isCacheAble()){
        if(NULL == this->ptr_cache_){
            this->ptr_cache_ = new FeatureArray***[this->num_networks_];
        }
        int networkId = ptr_network->GetNetworkID();
        if(NULL == this->ptr_cache_[networkId]){
            this->ptr_cache_[networkId] = new FeatureArray**[ptr_network->CountNodes()];
        }
        if(NULL == this->ptr_cache_[networkId][parent_k]){
            //size indicates the num of hyperedges.
            int size = sizeof(ptr_network->GetChildren(parent_k));
            this->ptr_cache_[networkId][parent_k] = new FeatureArray*[size];
        }
        FeatureArray *ptr_fa = this->ptr_cache_[networkId][parent_k][children_k_index];
        //if this FeatureArray pointer is cached in the ptr_cache, then return the pointer from the cache.
        if(NULL != ptr_fa){
            return ptr_fa;
        }
    }
    //if the feature Array is not cached in the ptr_cache, then extract it via feature manager
    FeatureArray *ptr_fa = this->ptr_fm_->Extract(ptr_network,parent_k,ptr_children_k,children_k_index);
    if(this->isCacheAble()){
        //store the FeatureArray pointer to the cache.
        this->ptr_cache_[ptr_network->GetNetworkID()][parent_k][children_k_index] = ptr_fa;
    }
    return ptr_fa;
}


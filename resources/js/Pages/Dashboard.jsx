import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link } from '@inertiajs/react';

export default function Dashboard({ notifications }) {
    return (
        <AuthenticatedLayout
            header={
                <h2 className="text-xl font-semibold leading-tight text-gray-800">
                    Dashboard
                </h2>
            }
        >
            <Head title="Dashboard" />

            <div className="py-12">
                <div className="mx-auto max-w-7xl sm:px-6 lg:px-8">
                    <div className="overflow-hidden bg-white shadow-sm sm:rounded-lg">
                        <div className="p-6 text-gray-900">
                            <h2 className='text-xl font-thin mb-3'>Notifications ({notifications && notifications.length})</h2>
                            
                            {
                                notifications.map(notification=>{
                                    {
                                        return (<div className='p-3 w-full mb-2 rounded-md bg-teal-100'>
                                            <p className='text-lg font-medium text-teal-900'>
                                                [{ new Date(notification.created_at).toLocaleString() }] New Order #{ notification.data.data.order_id } has been created by user: { notification.data.data.name }. 
                                            </p>
                                            <Link className='text-grey-100 font-normal mr-2 underline' href={ route('orders.show', { order: { id: notification.data.data.order_id }, readonly: true }) }>View Order</Link>
                                            <Link href={route('notification.markAsRead', { id: notification.id })} className='text-grey-100 font-normal underline'>Mark as Read</Link>
                                        </div>)
                                    }
                                    
                                })
                            }

                            {
                                notifications.length === 0 && (<p className='text-center'>There are no notifications.</p>)
                            }
                        </div>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
